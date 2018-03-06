<%--
  Created by IntelliJ IDEA.
  User: gy
  Date: 2017/4/17
  Time: 19:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static"></c:set>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
    <title>企业员工培训管理系统</title>
    <script type="text/javascript" src="${ctxStatic}/jquery/jquery-3.2.1.min.js"></script>
    <style type="text/css">
        .div_login{
            width: 450px;
            height: 300px;
            float: right;
            padding-top: 80px;
            margin-right: 10%}
        .div_sel_staff_type{padding: 50px 12px 12px;
                            margin: 10px}
        .div_username{padding: 12px;
                        margin: 10px}
        .div_pwd{padding: 12px;
            margin: 10px}
        .div_btlogin{padding:20px 12px 50px;
            margin: 10px;}
        #btlogin{
            height: 30px;
            width: 100px;
            float: left;
            border-right: solid;
            background-color: lightblue;
            color: #fff;
            text-align: center}
        #href_register{
                        padding: 12px;
                        font-family: "Arial Narrow";
                        font-size: 12px}
        #sel_staff_type,#username,#login_showPwd,#pwd{
            width: 70%;
            height: 10%; }
        .txt{color: #ccc}
        .focus{color: #000}
    </style>

    <script type="text/javascript">
        $(function ($) {
            $("#username").focus(function ()
            {
//                得到焦点
                if($(this).val()=="请输入用户名"){
                    $(this).val("");
                    $("#username").addClass("focus");
                }
            }).blur(function ()
            {
//                失去焦点
                if($(this).val()=="") {
                    $(this).val("请输入用户名");
                    $("#username").removeClass("focus")
                }
            });
            $("#login_showPwd").focus(function ()
            {
                if($("#login_showPwd").val() == "请输入密码"){
                    $("#login_showPwd").val("").hide();
                    $("#pwd").show().focus().addClass("focus");
                }
            });
            $("#pwd").blur(function ()
            {
                if($(this).val() == "") {
                    $(this).removeClass("focus").hide();
                    $("#login_showPwd").val("请输入密码").show();
                }
            });
        });

    </script>
    <script language="JavaScript" >
        function btClick() {
            var username = document.getElementById("username").value;
            var pwd  = document.getElementById("pwd").value;
            var show_pwd = document.getElementById("login_showPwd").value;
        }
    </script>

</head>

<body>
    <form action="${ctx}/userlogin/login" id="form_login"  onsubmit="return btClick()" method="post">
        <div class="div_login" >
            <fieldset id="">
                <legend>登录</legend>
                <div class="div_sel_staff_type"><select id="sel_staff_type" name="usertype">
                        <option value="员工" selected="true">普通员工</option>
                        <option value="教师">教师</option>
                        <option value="管理员">管理员</option>
                </select></div>
                <div class="div_username">
                    <input id="username" class="txt" type="text" name="username" value="请输入用户名" />
                </div>
                <div class="div_pwd">
                    <input type="text" class="txt" value="请输入密码" id="login_showPwd" />
                    <input id="pwd" class="txt" type="password" name="pwd" style="display: none" />
                </div>
                <div class="div_btlogin">
                    <table>
                        <tr>
                            <td rowspan="2"><input id="btlogin" type="submit" value="登录"></td>
                            <td/>
                        </tr>
                        <tr>
                            <td valign="bottom"><a id="href_register" href="page/register.jsp">管理员注册新账号</a></td>
                        </tr>
                    </table>
                </div>
            </fieldset>
        </div>
    </form>
</body>
</html>