<%@ page import="java.util.List" %>
<%@ page import="com.train.modules.entity.Teacher" %>
<%@ page import="com.train.modules.service.CourseService" %>
<%@ page import="com.train.modules.service.TeacherService" %><%--
  Created by IntelliJ IDEA.
  User: gy
  Date: 2017/5/9
  Time: 18:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //读出一个teacher的list；
    //List<Teacher> teachers = new TeacherService().getAllTeacher();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static"></c:set>
<html>
<head>
    <title>企业员工培训管理系统</title>
    <script type="text/javascript" src="${ctxStatic}/jquery/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery/bootstrap.min.js"></script>
    <link href="${ctxStatic}/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        #form_add_course {
            margin-left: 20%;
            margin-top: 3%
        }

        #course_name, #course_hours, #course_type,#course_place,#course_time,#sel_teacher{
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
        .func{margin-top: 18px;}
    </style>
    <script type="text/javascript">
        function check() {
            var isNum = /^[0-9]+$/;
            if ($("#course_name").val() == "" || $("#course_time").val() == "" || $("#course_place").val() == "") {
                alert("请输入完整信息!");
                return false;
            }else if (!isNum.test($("#course_hours").val())){
                alert("请输入正确的学时数!");
                return false;
            }
            return true;
        }

        $(function () {
            //遍历teacher的list 添加
            //$("#sel_teacher").append("<option value='"+2+"'>"+2+"</option>")

            $("#course_name").blur(function () {
                if ($(this).val() == "") {
                    $(this).siblings("span").text("请输入课程名称");
                } else {
                    $(this).siblings("span").text("");
                }
            });
            $("#course_hours").blur(function () {
                var isNum = /^[0-9]+$/;
                if (!isNum.test($(this).val())) {
                    $(this).siblings("span").text("请输入课程学时数");
                } else {
                    $(this).siblings("span").text("");
                }
            });
            $("#course_place").blur(function () {
                if ($(this).val() == "") {
                    $(this).siblings("span").text("请输入上课地点");
                } else {
                    $(this).siblings("span").text("");
                }
            });
            $("#course_time").blur(function () {
//                var isMobile = /^1\d{10}$/;
//                if (!isMobile.test($(this).val())) {
//                    $(this).siblings("span").text("请输入上课时间");
//                    $(this).val("");
//                } else {
//                    $(this).siblings("span").text("");
//                }
            });
        })
    </script>
</head>
<body>
<form role="form" id="form_add_course" action="addcourse" onsubmit="return check()">
    <div class="form-group">
        <input type="text" id="course_name" placeholder="课程名称" name="coursename"><span></span>
    </div>
    <div class="form-group">
        <input type="text" id="course_hours" placeholder="课程学时数" name="credit"><span></span>
    </div>
    <div class="form-group">
        <select id="course_type" title="课程类别" name="coursetype">
            <option value="请选择" selected>请选择</option>
            <option value="选修课" >选修课</option>
            <option value="必修课">必修课</option>
            <option value="专业课">专业课</option>
        </select>
    </div>
    <div class="form-group">
        <input type="text" id="course_place" placeholder="上课地点" name="location"><span></span>
    </div>
    <div class="form-group">
        <input type="text" id="course_time" placeholder="上课时间" name="duration"><span></span>
    </div>
    <div class="form-group">
        <form:select path="teacher.TeacherId" id="sel_teacher">
            <option value="请选择" selected>请选择</option>
            <form:options items="${teachers}" itemLabel="TeaName" itemValue="TeacherId"></form:options>
        </form:select>
    </div>
    <div class="func"><input type="submit" id="bt_register" value="提交">
        <input type="reset" id="reset" value="重置"></div>
</form>
</body>
</html>
