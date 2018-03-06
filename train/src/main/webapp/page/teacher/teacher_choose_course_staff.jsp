<%--
  Created by IntelliJ IDEA.
  User: gy
  Date: 2017/5/2
  Time: 15:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static"></c:set>
<html>
<head>
    <title>企业员工培训管理系统</title>

    <script type="text/javascript" src="${ctxStatic}/jquery/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery/page.js"></script>
    <link href="${ctxStatic}/css/bootstrap.min.css" rel="stylesheet">

    <style type="text/css">
        #tb_chose_course{width: 90%;margin: 20px;}
        #tb_chose_course tr th{height: 50px;background-color: lightblue}
        .table th, .table td {
            text-align: center;
            vertical-align: middle!important;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            jQuery.page("div_chose_course",10);
            $("#tb_chose_course tr:not('#tr_th'):odd").css("background-color","#cccccc");
        })
    </script>
</head>
<body>
<div id="div_chose_course">
    <table id="tb_chose_course"  class="table table-bordered">
        <thead>
            <tr id="tr_th">
            <th>员工号</th>
            <th>员工姓名</th>
            <th>所属部门</th>
            </tr>
        </thead>
        <tbody>
        <c:if test="${chooselist.size()==0}">
            <td colspan="3">抱歉，没有人选这门课，<a href="../teacher/course?teaId=${teaid}">返回</a></td>
        </c:if>
        <c:forEach items="${chooselist}" var="choose">
            <tr>
                <td>
                    ${choose.EmpId}
                </td>
                <td>
                    ${choose.EmpName}
                </td>
                <td>
                    ${choose.DeptName}
                </td>
            </tr>
        </c:forEach>
        </tbody>
        <% %>
    </table>
</div>


</body>
</html>
