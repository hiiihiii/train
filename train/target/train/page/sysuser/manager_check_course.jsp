<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static"></c:set>
<%--
  Created by IntelliJ IDEA.
  User: gy
  Date: 2017/5/9
  Time: 22:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>企业员工培训管理系统</title>
    <script type="text/javascript" src="${ctxStatic}/jquery/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery/page.js"></script>
    <link href="${ctxStatic}/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        #tb_check_course {
            width: 70%;
            margin: 20px auto;
        }

        #tb_check_course tr th {
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
            jQuery.page("div_check_course", 10);
            $("#tb_check_course tr:not('#tr_th'):odd").css("background-color", "#cccccc");
        })
    </script>
</head>
<body>
<div id="div_check_course">
    <table id="tb_check_course" class="table table-bordered">
        <thead>
        <tr id="tr_th">
            <th>课程名称</th>
            <th>课程学时</th>
            <th>课程类别</th>
            <th>上课地点</th>
            <th>上课时间</th>
            <th>上课教师</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${courses.size()==0}">
            <td colspan="6">还没有课程，请<a href="../sysuser/manager_add_course.jsp">添加</a> </td>
        </c:if>
        <c:if test="${courses.size()!=0}">
            <c:forEach items="${courses}" var="course">
                <tr>
                    <td>${course.CourseName}</td>
                    <td>${course.Credit}</td>
                    <td>${course.CourseType}</td>
                    <td>${course.Location}</td>
                    <td>${course.Duration}</td>
                    <td>${course.TeaName}</td>
                </tr>
            </c:forEach>
        </c:if>
        </tbody>
    </table>
</div>
</body>
</html>

