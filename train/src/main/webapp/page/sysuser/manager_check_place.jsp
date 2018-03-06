<%--
  Created by IntelliJ IDEA.
  User: gy
  Date: 2017/5/7
  Time: 11:06
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
        #tb_check_place {
            width: 70%;
            margin: 20px auto;
        }

        #tb_check_place tr th {
            height: 50px;
            background-color: lightblue
        }

        .table th, .table td {
            text-align: center;
            vertical-align: middle !important;
        }
        #div_dept {
            margin-left: 10%;
            margin-top: 20px;
        }
        #dept_label {
            font-family: "Fira Code Medium",serif;
            font-size: 30px;
            color: black
        }
    </style>
    <script type="text/javascript">
        $(function () {
            jQuery.page("div_check_place", 10);
            $("#tb_check_place tr:not('#tr_th'):odd").css("background-color", "#cccccc");
        })
    </script>
</head>
<body>
<div id="div_dept"><span id="dept_label">${deptname}</span></div>
<div id="div_check_place">
    <table id="tb_check_place" class="table table-bordered">
        <thead>
        <tr id="tr_th">
            <th>岗位名称</th>
            <th>岗位职责</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${jobs.size()==0}">
            <td colspan="2">该部门还没有岗位，<a href="../job/index">返回</a></td>
        </c:if>
        <c:if test="${jobs.size()!=0}">
            <c:forEach items="${jobs}" var="job">
            <tr>
                <td>${job.jobName}</td>
                <td>${job.jobIntro}</td>
            </tr>
            </c:forEach>
        </c:if>
        </tbody>
    </table>
</div>
</body>
</html>
