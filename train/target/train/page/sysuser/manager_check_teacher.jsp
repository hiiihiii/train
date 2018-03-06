<%--
  Created by IntelliJ IDEA.
  User: gy
  Date: 2017/5/8
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static"></c:set>
<html>
<head>
    <title>企业员工培训管理系统</title>
    <script type="text/javascript" src="${ctxStatic}/jquery/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery/page.js"></script>
    <link href="${ctxStatic}/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        #tb_check_teacher {
            width: 70%;
            margin: 20px auto;
        }

        #tb_check_teacher tr th {
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
            jQuery.page("div_check_teacher", 2);
            $("#tb_check_teacher tr:not('#tr_th'):odd").css("background-color", "#cccccc");
        })
    </script>
</head>
<body>
<div id="div_check_teacher">
    <table id="tb_check_teacher" class="table table-bordered">
        <thead>
        <tr id="tr_th">
            <th>教师姓名</th>
            <th>性别</th>
            <th>出生日期</th>
            <th>职称</th>
            <th>简介</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${teachers.size()==0}">
            <td colspan="6">还没有教师，请<a href="../sysuser/manager_add_teacher.jsp"> 添加</a></td>
        </c:if>
        <c:forEach items="${teachers}" var="teacher">
            <tr>
                <td>${teacher.teaName}</td>
                <td>${teacher.teaSex}</td>
                <td>
                        <fmt:formatDate value="${teacher.birthDate}"/>
                </td>
                <td>${teacher.title}</td>
                <td>${teacher.intro}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>

