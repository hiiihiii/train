<%--
  Created by IntelliJ IDEA.
  User: gy
  Date: 2017/5/2
  Time: 22:58
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
        #tb_edit_dept {
            width: 70%;
            margin: 20px auto;
        }

        #tb_edit_dept tr th {
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
            jQuery.page("div_edit_dept", 10);
            $("#tb_edit_dept tr:not('#tr_th'):odd").css("background-color", "#cccccc");
        })
    </script>
</head>
<body>
<div id="div_edit_dept">
    <table id="tb_edit_dept" class="table table-bordered">
        <thead>
        <tr id="tr_th">
            <th>部门名称</th>
            <th>编辑</th>
        </tr>
        </thead>

        <tbody>
        <c:if test="${departmentList.size()==0}">
            <td colspan="2">还没有部门哦，请<a href="../sysuser/manager_add_dept.jsp">添加</a> </td>
        </c:if>
        <c:if test="${departmentList.size()!=0}">
        <c:forEach items="${departmentList}" var="department" varStatus="status">
            <tr>
                <td>${department.deptName}</td>
                <td><a href="manager_edit_res_dept.jsp?deptid=${department.deptId}">编辑</a></td>
            </tr>
        </c:forEach>
        </c:if>
        </tbody>
    </table>
</div>
</body>
</html>
