<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: gy
  Date: 2017/5/6
  Time: 21:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static"></c:set>
<html>
<head>
    <title>企业员工培训管理系统</title>
    <script type="text/javascript" src="${ctxStatic}/jquery/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery/page.js"></script>
    <link href="${ctxStatic}/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        #tb_place {
            width: 80%;
            margin: 20px auto;
        }

        #tb_place tr th {
            height: 50px;
            background-color: lightblue
        }

        .table th, .table td {
            text-align: center;
            vertical-align: middle !important;
        }
    </style>
    <script type="text/javascript">


        $(function () {
            jQuery.page("div_palce",10);
            $("#tb_place tr:not('#tr_th'):odd").css("background-color", "#cccccc");
        })
    </script>
</head>
<body>
<div class="div_palce" id="div_place">
    <table id="tb_place"  class="table table-bordered">
        <thead>
        <tr id="tr_th">
            <th>部门名称</th>
            <th>部门经理</th>
            <th>增加岗位</th>
            <th>修改岗位</th>
            <th>删除岗位</th>
            <th>查看岗位</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${departmentList}" var="department">
            <tr>
                <td>${department.deptName}</td>
                <td>${department.manager}</td>
                <td><a href="../job/addJobIndex?deptid=${department.deptId}">增加岗位</a></td>
                <td><a href="../job/updateJobIndex?deptid=${department.deptId}&deptname=${department.deptName}">修改岗位</a></td>
                <td><a href="../job/deleteJobIndex?deptid=${department.deptId}">删除岗位</a></td>
                <td><a href="../job/checkJobs?deptid=${department.deptId}&deptname=${department.deptName}">查看岗位</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <br/>
</div>
</body>
</html>
