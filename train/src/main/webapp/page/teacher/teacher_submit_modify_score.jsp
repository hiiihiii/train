<%--
  Created by IntelliJ IDEA.
  User: gy
  Date: 2017/5/2
  Time: 16:59
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
        #tb_sm_score {width: 90%;margin: 10px 20px;}

        #tb_sm_score tr th {height: 50px;background-color: lightblue}

        .table th, .table td {
            text-align: center;
            vertical-align: middle !important;
        }
        #div_course_name {
            margin: 10px;
        }

        #span_course_name {
            font-family: "Fira Code Medium",serif;
            font-size: 20px;
            margin-left: 10px;
            color: black
        }
        #div_submit{
            width: 15%;
            margin: 20px auto;
        }
        #sub_save{
            height: 30px;
            width: 80px;
            border-right: solid;
            text-align: center;
            background-color: lightblue;
            color: #fff;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            jQuery.page("div_sm_score", 10);
            $("#tb_sm_score tr:not('#tr_th'):odd").css("background-color", "#cccccc");
        })
    </script>
</head>
<body>
<div id="div_course_name">
    <span id="span_course_name">${chooselist[0].CourseName}</span>
</div>
<form action="empneeds/addscores" method="post" id="form_sm_score">
    <input style="display: none" name="courseid" value="${chooselist[0].CourseId}">
    <input style="display: none" name="teacherid" value="${chooselist[0].TeacherId}">
    <div id="div_sm_score">
        <table id="tb_sm_score" class="table table-bordered">
            <thead>
            <tr id="tr_th">
                <th>员工号</th>
                <th>员工姓名</th>
                <th>所属部门</th>
                <th>成绩</th>
            </tr>
            </thead>
            <tbody>
            <c:if test="${chooselist.size()==0}">
                <td colspan="4">抱歉，没有员工选这门课，您无法提交成绩。<a href="../teacher/setscoreindex?teaId=${teaid}">返回</a></td>
            </c:if>
            <c:forEach items="${chooselist}" var="choose">
            <tr>
                <td>${choose.EmpId}</td>
                <td>${choose.EmpName}</td>
                <td>${choose.DeptName}</td>
                <td>
                    <input id="in_score" name="${choose.EmpId}" value="${choose.Score}"/>
                </td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
        <div id="div_submit">
            <input id="sub_save" type="submit" value="保存"/>
        </div>
    </div>
</form>
</body>
</html>
