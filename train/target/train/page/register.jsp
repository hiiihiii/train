<%--
  Created by IntelliJ IDEA.
  User: gy
  Date: 2017/4/18
  Time: 10:35
  To change this template use File | Settings | File Templates.
--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static"></c:set>
<html>
<head>
    <title>企业员工培训管理系统</title>
    <script type="text/javascript" src="${ctxStatic}/jquery/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery/jquery.validate.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery/messages_zh.js"></script>
    <style type="text/css">
        .div_con{margin-left: 300px;overflow: visible}
        .title_label{float: left}
        #span_label{font-family: "Fira Code Medium";font-size: 35px;margin-left: 70px;color: black}
        .sel{padding: 70px 12px 12px;margin: 10px}
        .div_username{padding: 12px;
            margin: 10px}
        .div_pwd{padding: 12px;
            margin: 10px}
        .firm_div_pwd{padding: 12px;
            margin: 10px;}
        #sel_staff_type,#username,#show_pwd,#pwd,#show_firm_pwd,#firm_pwd{
             width: 300px;
             height: 40px; }
        #bt_register,#reset{
            height: 30px;
            width: 80px;
            margin: 20px;
            border-right: solid;
            text-align: center}
        #bt_register{
            background-color: lightblue;
            color: #fff;
        }
        #reset{
            background-color: #aaaaaa;
            color: lightblue;
        }
        .txt{color: #ccc}
        .focus{color: #000}
        span{font-size: 0.1px;color: red}
    </style>
    <script type="text/javascript">

        $(function () {
            $("#username").focus(function () {
                if ($(this).val()=="用户名")
                {
                    $(this).val("");
                    $(this).addClass("focus");
                }
            }).blur(function () {
                if ($(this).val()=="")
                {
                    $(this).val("用户名")
                    $(this).removeClass("focus");
                }
            });
            $("#show_pwd").focus(function () {
                if ($(this).val()=="密码")
                {
                    $(this).hide();
                    $("#pwd").addClass("focus").show().focus();
                }
            });
            $("#pwd").blur(function () {
                if ($(this).val()=="")
                {
                    $(this).removeClass("focus").hide();
                    $("#show_pwd").show();
                }
            });
            $("#show_firm_pwd").focus(function () {
                if ($(this).val()=="再次输入密码")
                {
                    $(this).hide();
                    $("#firm_pwd").addClass("focus").show().focus();
                }
            });
            $("#firm_pwd").blur(function () {
                if ($(this).val()=="")
                {
                    $(this).removeClass("focus").hide();
                    $("#show_firm_pwd").show();
                }
            });

            var validator = $("#form_register").validate({
                rules:{
                    username:{required:true,minlength:4},
                    pwd:{required:true,
                        minlength:8},
                    firm_pwd:{required:true,
                        minlength:8,
                        equalTo:"#pwd"},
                    show_pwd:{required:true,minlength:8},
                    show_firm_pwd:{required:true,minlength:8},
                    submitHandle:function (form) {
                        alert("提交表单");
                        form.submit();
                    }
                },
                errorPlacement:function (error,element) {
                    error.appendTo(element.siblings("span"));
                }
            });
            $("#reset").click(function () {
                validator.resetForm();
                  $("#username").removeClass("focus");
                  $("#pwd").removeClass("focus").hide();
                  $("#show_pwd").show();
                  $("#firm_pwd").removeClass("focus").hide();
                  $("#show_firm_pwd").show();
            });
        });

    </script>
</head>

<body>
    <form action="../sysuser/regist" id="form_register" method="post">
        <div class="title_label"><span id="span_label">注册</span></div>
        <div class="div_con">
            <div class="sel"><select id="sel_staff_type"><option selected="true" value="管理员">管理员</option></select></div>
            <div class="div_username"><input id="username" name="username" type="text" value="用户名" class="txt"/> <span></span></div>
            <div class="div_pwd">

                <input type="text" id="show_pwd" name="show_pwd" value="密码" class="txt"/>
                <input type="password" id="pwd" name="pwd" style="display: none" />

                <span></span>
            </div>
            <div class="firm_div_pwd">
                <input type="text" id="show_firm_pwd" name="show_firm_pwd" value="再次输入密码" class="txt"/>
                <input type="password" id="firm_pwd" name="firm_pwd" style="display: none" class="txt"/>
                <span></span>
            </div>
            <div class="bt">
                <input type="submit" id="bt_register" value="提交"/>
                <input type="reset" id="reset"  value="重置"/>
            </div>
        </div>
    </form>
</body>
</html>
