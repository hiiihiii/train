<%--
  Created by IntelliJ IDEA.
  User: gy
  Date: 2017/5/8
  Time: 15:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static"></c:set>
<%
    String teacher_name = request.getParameter("name");
    String sex = request.getParameter("sex");
    String birth_date = request.getParameter("date");
    String rank = request.getParameter("rank");
    String intro = request.getParameter("intro");
%>
<html>
<head>
    <title>企业员工培训管理系统</title>
    <script type="text/javascript" src="${ctxStatic}/jquery/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery/page.js"></script>
    <link href="${ctxStatic}/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        #form_edit_teacher {
            margin-left: 20%;
            margin-top: 3%
        }

        #teacher_name, #sel_sex, #birth_date, #sel_rank {
            width: 300px;
            height: 40px;
        }

        .form-group {
            padding: 10px;
            margin: 2px
        }

        #bt_register, #reset {
            height: 30px;
            width: 80px;
            margin: 4px 15px;
            border-right: solid;
            text-align: center
        }

        #bt_register {
            background-color: lightblue;
            color: #fff;
        }

        #reset {
            background-color: #aaaaaa;
            color: lightblue;
        }

        span {
            font-size: 0.1px;
            color: red
        }
    </style>
    <script type="text/javascript">
        function check() {
            if ($("#teacher_name").val() == "" || $("#teacher_intro").val() == "") {
                {
                    alert("信息不能为空，您可以重置!");
                    return false;
                }
                return true;

            }
            $(function () {
                $("#teacher_name").val(<%=teacher_name%>);
                $("#sel_sex").val(<%=sex%>);
                $("#birth_date").val(<%=birth_date%>);
                $("#sel_rank").val(<%=rank%>);
                $("#teacher_intro").val(<%=intro%>);

                $("#teacher_name").blur(function () {
                    if ($(this).val() == "") {
                        $(this).siblings("span").text("请输入教师姓名");
                    } else {
                        $(this).siblings("span").text("");
                    }
                });
                $("#teacher_intro").blur(function () {
                    if ($(this).val() == "") {
                        $(this).siblings("span").text("请输入教师简介");
                    } else {
                        $(this).siblings("span").text("");
                    }
                });
                $("#reset").click(function () {
                    $("#teacher_name").val(<%=teacher_name%>);
                    $("#sel_sex").val(<%=sex%>);
                    $("#birth_date").val(<%=birth_date%>);
                    $("#sel_rank").val(<%=rank%>);
                    $("#teacher_intro").val(<%=intro%>);
                });

            })
        }
    </script>
</head>
<body>
<form role="form" id="form_edit_teacher" action="../teacher/edit" onsubmit="return check()">
    <input name="teaid" value="${teacher.teacherId}" style="display: none" type="text" />
    <div class="form-group">
        <input type="text" id="teacher_name" placeholder="教师姓名" name="teaname" value="${teacher.teaName}"><span></span>
    </div>
    <div class="form-group">
        <form:select path="teacher.TeaSex" id="sel_sex" >
            <form:option value="" label="请选择"/>
            <form:option value="男">男</form:option>
            <form:option value="女">女</form:option>
        </form:select><span></span>
    </div>
    <div class="form-group">
        <input type="date" id="birth_date" name="birth_date" title="出生日期" value="${teacher.birthDate}"/><span></span>
    </div>
    <div class="form-group">
        <form:select path="teacher.Title" id="sel_rank" >
            <form:option value="" label="请选择"/>
            <form:option value="教授">教授</form:option>
            <form:option value="副教授">副教授</form:option>
            <form:option value="助教">助教</form:option>
            <form:option value="讲师">讲师</form:option>
        </form:select><span></span>
    </div>
    <div class="form-group">
        <textarea id="teacher_intro" rows="7" cols="60" placeholder="教师简介" name="teaintro">
            ${teacher.intro}
        </textarea><span></span>
    </div>
    <div class="form-group">
        <input type="submit" id="bt_register" value="提交">
        <input type="reset" id="reset" value="重置">
    </div>
</form>
</body>
</html>
