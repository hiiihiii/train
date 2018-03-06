<%--
  Created by IntelliJ IDEA.
  User: gy
  Date: 2017/5/2
  Time: 16:44
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
        #tb_check_score{width: 90%;margin: 10px 20px;}
        #tb_check_score tr th{height: 50px;background-color: lightblue}
        .table th, .table td {
            text-align: center;
            vertical-align: middle!important;
        }

        #div_course_name {
            margin: 10px;
        }

        #span_course_name {
            font-family: "Fira Code Medium";
            font-size: 20px;
            margin-left: 10px;
            color: black
        }

    </style>
    <script type="text/javascript">
        $(function () {
            jQuery.page("div_check_score",10);
            $("#tb_check_score tr:not('#tr_th'):odd").css("background-color","#cccccc");
        })
    </script>
</head>
<body>
<div id="div_course_name"><span id="span_course_name">${chooseList[0].CourseName}</span></div>
<div id="div_check_score">
    <table id="tb_check_score"  class="table table-bordered">
        <thead>
        <tr id="tr_th">
            <th>员工号</th>
            <th>员工姓名</th>
            <th>所属部门</th>
            <th>成绩</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${chooseList}" var="one">
            <tr>
                <td>${one.EmpId}</td>
                <td>${one.EmpName}</td>
                <td>${one.DeptName}</td>
                <c:if test="${one.IsScore==0}">
                    <td>成绩未登记</td>
                </c:if>
                <c:if test="${one.IsScore==1}">
                    <td>${one.Score}</td>
                </c:if>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
