<%--
  Created by IntelliJ IDEA.
  User: gy
  Date: 2017/5/8
  Time: 12:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static"></c:set>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
    <title>企业员工培训管理系统</title>
    <script type="text/javascript" src="${ctxStatic}/jquery/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery/page.js"></script>
    <link href="${ctxStatic}/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        #form_add_teacher {
            margin-left: 20%;
            margin-top: 3%
        }

        #teacher_name, #birth_date, #sel_rank {
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
        #sex_female,#sex_male{width: 40px}

    </style>
    <script type="text/javascript">
        function check() {
            if ($("#teacher_name").val() == "" || $("#teacher_intro").val() == "") {
                alert("请输入完整信息!");
                return false;
            }
            return true;

        }
        $(function () {
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

            var birth_time = new Date();
            var year = birth_time.getFullYear();
            var month = birth_time.getMonth();
            var date = birth_time.getDate();
            var day = "";
            if (month < 10) {
                day = year + "-0" + month;
            } else {
                day = year + "-" + month;
            }
            if (date <10){
                day += "-0"+date;
            }else {
                day += "-"+date;
            }
            $("#birth_date").attr("value",day)
        })
    </script>
</head>
<body>
<form role="form" id="form_add_teacher" action="../teacher/addteacher" onsubmit="return check()">
    <div class="form-group">
        <input type="text" id="teacher_name" placeholder="教师姓名" name="teaname">
        <span></span>
    </div>
    <div class="form-group">
        <input type="radio" id="sex_male" name="sex" value="男" placeholder="性别" checked/>男
        <input type="radio" id="sex_female" name="sex" value="女" placeholder="性别"/> 女<span></span>
    </div>
    <div class="form-group">
        <input type="date" id="birth_date" name="birth_date" title="出生日期"/><span></span>
    </div>
    <div class="form-group">
        <select id="sel_rank" title="职称" name="title">
            <option selected>请选择</option>
            <option value="教授">教授</option>
            <option value="副教授">副教授</option>
            <option value="助教">助教</option>
            <option value="讲师">讲师</option>
        </select><span></span>
    </div>
    <div class="form-group">
        <textarea id="teacher_intro" rows="7" cols="60" placeholder="教师简介" name="teaintro">
        </textarea><span></span>
    </div>
    <div class="form-group"><input type="submit" id="bt_register" value="提交">
        <input type="reset" id="reset" value="重置">
    </div>
</form>
</body>
</html>
