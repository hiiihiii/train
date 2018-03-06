<%--
  Created by IntelliJ IDEA.
  User: gy
  Date: 2017/5/2
  Time: 16:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static"></c:set>
<%
    //    Boolean alSubScore = (Boolean) request.getAttribute("");
    Boolean alSubScore = false;
%>
<html>
<head>
    <title>企业员工培训管理系统</title>
    <script type="text/javascript" src="${ctxStatic}/jquery/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery/page.js"></script>
    <link href="${ctxStatic}/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        #tb_submit_score {
            width: 90%;
            margin: 20px;
        }

        #tb_submit_score tr th {
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
            <%
            if (alSubScore){
            %>
            $("#a_s_m").text("修改成绩");
            <%
            }else {
            %>
            $("#a_s_m").text("提交成绩");
            <%
            }
            %>
            jQuery.page("div_submit_score", 10);
            $("#tb_submit_score tr:not('#tr_th'):odd").css("background-color", "#cccccc");
        })
    </script>
</head>
<body>
<div id="div_submit_score">
    <table id="tb_submit_score" class="table table-bordered">
        <thead>
            <tr id="tr_th">
                <th>课程名称</th>
                <th>课程学时</th>
                <th>课程类别</th>
                <th>上课地点</th>
                <th>上课时间</th>
                <th>成绩</th>
                <th>查看成绩单</th>
            </tr>
        </thead>
        <tbody>
        <c:if test="${courses.size()==0}">
            <td colspan="7">您还没开任何课</td>
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
                <td><a id="a_s_m" href="submitScore_empList?courseid=${course.getCourseId()}&teaid=${teaid}">提交成绩</a></td>
                <td><a href="empneeds/teacheckscore?courseid=${course.getCourseId()}&teaid=${teaid}">查看</a></td>
            </tr>
        </c:forEach>
        </c:if>
        </tbody>
    </table>
</div>

</body>
</html>
