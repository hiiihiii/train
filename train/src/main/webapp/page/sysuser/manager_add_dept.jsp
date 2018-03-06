<%--
  Created by IntelliJ IDEA.
  User: gy
  Date: 2017/5/2
  Time: 19:51
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
    <script type="text/javascript" src="${ctxStatic}/jquery//page.js"></script>
    <link href="${ctxStatic}/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        #form_add_dept {
            margin-left: 20%;
            margin-top: 7%
        }

        #dept_name, #dept_director {
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
            margin: 20px;
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
            if ($("#dept_name").val()=="" || $("#dept_director").val()=="" )
            {     alert("请输入完整信息!");
                return false;
            }
            return true;

        }
        $(function () {
            $("#dept_name").blur(function () {
                if ($(this).val() == "") {
                    $(this).siblings("span").text("请输入部门名称");
                }else {
                    $(this).siblings("span").text("");
                }
            })
            $("#dept_director").blur(function () {
                if ($(this).val() == "") {
                    $(this).siblings("span").text("请输入部门经理");
                }else {
                    $(this).siblings("span").text("");
                }
            })
        })
    </script>
</head>
<body>
<form role="form" action="../sysuser/addDept" id="form_add_dept"  onsubmit="return check()" >
    <div class="form-group">
        <input type="text" id="dept_name" placeholder="部门名称" name="deptname"><span></span>
    </div>
    <div class="form-group">
        <input type="text" id="dept_director" placeholder="部门经理" name="deptmanager"><span></span>
    </div>
    <div class="form-group"><input type="submit" id="bt_register" value="提交">
        <input type="reset" id="reset" value="重置">
    </div>
</form>
</body>
</html>
