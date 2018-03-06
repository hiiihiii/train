<%--
  Created by IntelliJ IDEA.
  User: gy
  Date: 2017/4/26
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static"></c:set>
<%
//    Boolean alreadyTM = (Boolean) request.getAttribute("");
     Boolean alreadyTM = false;
%>
<html>
<head>
    <title>企业员工培训管理系统</title>

    <script type="text/javascript" src="${ctxStatic}/jquery/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery/page.js"></script>
    <style type="text/css">
        #tb_check{
            /*border-collapse: collapse;border:none;width: 80%;text-align: center*/
            width: 90%;
            margin: 20px;
        }
        #tb_check tr th,td{
            /*border: solid #544f6b 1px;*/
            text-align: center;
            vertical-align: middle !important;
        }
        #tb_check tr th{
            height: 50px;background-color: lightblue
        }



    </style>
    <script type="text/javascript">
        $(function () {
            jQuery.page("div_tea_check",10);
            $("#tb_check tr:not('#tr_th'):odd").css("background-color","#cccccc");
        })
    </script>
</head>

<body>

<div id="div_tea_check">
    <table id="tb_check">
        <thead>
            <tr id="tr_th">
                <th>课程名称</th>
                <th>课程学时</th>
                <th>课程类别</th>
                <th>上课地点</th>
                <th>上课时间</th>
                <th>选课名单</th>
                <th>教材</th>
            </tr>
        </thead>
        <tbody>
        <c:if test="${courses.size()==0}">
            <td colspan="7">您还未开任何课</td>
        </c:if>
        <c:if test="${courses.size()!=0}">
        <c:forEach items="${courses}" var="course"  varStatus="status">
            <tr>
                <td>
                    ${course.getCourseName()}
                </td>
                <td>
                    ${course.getCredit()}
                </td>
                <td>
                    ${course.getCourseType()}
                </td>
                <td>
                    ${course.getLocation()}
                </td>
                <td>
                    ${course.getDuration()}
                </td>
                <td><a href="chooseList?courseid=${course.getCourseId()}&teaid=${course.getTeacherId()}">查看选课名单</a></td>
                <c:choose>
                    <c:when test="${course.bookId==0}">
                        <td><a href="textbook?courseid=${course.getCourseId()}">提交教材</a></td>
                    </c:when>
                    <c:when test="${course.bookId!=0}">
                        <td><a href="textbook/editform?courseid=${course.getCourseId()}">修改教材</a></td>
                    </c:when>
                </c:choose>
            </tr>
        </c:forEach>
        </c:if>
        </tbody>
        <% %>
    </table>
</div>
</body>
</html>