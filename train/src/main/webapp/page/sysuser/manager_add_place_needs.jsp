<%--
  Created by IntelliJ IDEA.
  User: gy
  Date: 2017/5/8
  Time: 11:02
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
        #tb_add_place_needs {
            width: 70%;
            margin: 20px auto;
        }

        #tb_add_place_needs tr th {
            height: 50px;
            background-color: lightblue
        }

        .table th, .table td {
            text-align: center;
            vertical-align: middle !important;
        }
        #div_place {
            margin-left: 10%;
            margin-top: 20px;
        }
        #place_label {
            font-family: "Fira Code Medium",serif;
            font-size: 30px;
            color: black
        }
    </style>
    <script type="text/javascript">
        $(function () {
            jQuery.page("div_add_place_needs", 10);
            $("#tb_add_place_needs tr:not('#tr_th'):odd").css("background-color", "#cccccc");
        })
    </script>
</head>
<body>
<div id="div_place"><span id="place_label">${job.jobName}</span></div>
<div id="div_add_place_needs">
    <table id="tb_add_place_needs" class="table table-bordered">
        <thead>
        <tr id="tr_th">
            <th>课程名称</th>
            <th>加入岗位需求</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${courses.size()==0}">
            <td colspan="2">该岗位需求已包含了所有课程，<a href="../jobneeds/index">返回</a> </td>
        </c:if>
        <c:forEach items="${courses}" var="course">
        <tr>
            <td>${course.courseName}</td>
            <td><a href="../jobneeds/addJobNeeds?jobid=${job.jobId}&courseid=${course.courseId}">添加</a></td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
