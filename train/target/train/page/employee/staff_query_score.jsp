<%--
  Created by IntelliJ IDEA.
  User: gy
  Date: 2017/4/22
  Time: 9:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static"></c:set>
<%
  //  Boolean alreadyJudge = (Boolean) request.getAttribute("");
    Boolean alreadyJudge = false;
%>
<html>
<head>
    <title>企业员工培训管理系统</title>
    <script type="text/javascript" src="${ctxStatic}/jquery/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery/page.js"></script>
    <style type="text/css">
        #tb_query{border-collapse: collapse;border:none;width: 80%;text-align: center}
        #tb_query tr th,td{border: solid #544f6b 1px;}
        #tb_query tr th{height: 50px;background-color: lightblue}
    </style>
    <script type="text/javascript">
        $(function () {
            jQuery.page("div_query",10);
            $("#tb_query tr:not('#tr_th'):odd").css("background-color","#cccccc")
        })
    </script>
</head>

<body>
<div class="div_query">
    <table id="tb_query">
        <thead>
        <tr id="tr_th">
            <th>课程名称</th>
            <th>课程学时</th>
            <th>课程类别</th>
            <th>上课地点</th>
            <th>上课时间</th>
            <th>教师</th>
            <th>成绩</th>
            <th>评价</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${scores.size()==0}">
            <td colspan="8">您没有选课，无法查看成绩。<a href="../employee/selection?userId=${employee.empId}&deptid=${employee.deptId}">返回</a></td>
        </c:if>
        <c:forEach items="${scores}" var="score">
            <tr>
                <td>${score.CourseName}</td>
                <td>${score.get("Credit")}</td>
                <td>${score.get("CourseType")}</td>
                <td>${score.get("Location")}</td>
                <td>${score.get("Duration")}</td>
                <td>${score.get("TeaName")}</td>
                <c:choose>
                    <c:when test="${score.IsScore == 0}">
                        <td>成绩未出</td>
                    </c:when>
                    <c:when test="${score.IsScore == 1}">
                        <c:choose>
                        <c:when test="${empty score.Content}">
                            <td>请先评价</td>
                        </c:when>
                        <c:when test="${not empty score.Content}">
                            <td>${score.Score}</td>
                        </c:when>
                        </c:choose>
                    </c:when>
                    <c:otherwise>
                        <td>OPS！系统出错了！</td>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${score.IsScore == 0}">
                        <td>暂不能评价</td>
                    </c:when>
                    <c:when test="${score.IsScore == 1}">
                        <c:choose>
                        <c:when test="${empty score.Content}">
                            <td><a href="../employee/commindex?empid=${score.EmpId}&courseid=${score.CourseId}">点击评价</a></td>
                        </c:when>
                        <c:when test="${not empty score.Content}">
                            <td>查看评价</td>
                        </c:when>
                        </c:choose>
                    </c:when>
                    <c:otherwise>
                        <td>OPS！系统出错了！</td>
                    </c:otherwise>
                </c:choose>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>