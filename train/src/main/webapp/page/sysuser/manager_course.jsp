<%--
  Created by IntelliJ IDEA.
  User: gy
  Date: 2017/5/9
  Time: 22:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>企业员工培训管理系统</title>
    <script type="text/javascript" src="../Jscript/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../Jscript/bootstrap.min.js"></script>
    <script type="text/javascript" src="../Jscript/page.js"></script>
    <link href="../Css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        #tb_place {
            width: 80%;
            margin: 20px auto;
        }

        #tb_place tr th {
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
            jQuery.page("div_palce",2);
            $("#tb_place tr:not('#tr_th'):odd").css("background-color", "#cccccc");
        })
    </script>
</head>
<body>
<div class="div_palce" id="div_place">
    <table id="tb_place"  class="table table-bordered">
        <tr id="tr_th">
            <th>部门名称</th>
            <th>部门经理</th>
            <th>增加岗位</th>
            <th>修改岗位</th>
            <th>删除岗位</th>
            <th>查看岗位</th>
        </tr>
        <%--<% %>--%>
        <tr>
            <td><%--<%=%>--%></td>
            <td><%--<%=%>--%></td>
            <td><a href="manager_add_course.jsp">增加课程</a></td>
            <td><a href="manager_edit_course.jsp">修改课程</a></td>
            <td><a href="manager_del_course.jsp">删除课程</a></td>
            <td><a href="manager_check_course.jsp">查看课程</a></td>
        </tr>

    </table>
    <br/>
</div>
</body>
</html>
