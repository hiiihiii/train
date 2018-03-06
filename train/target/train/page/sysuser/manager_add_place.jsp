<%--
  Created by IntelliJ IDEA.
  User: gy
  Date: 2017/5/7
  Time: 10:20
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
        #form_add_place {
            margin-left: 20%;
            margin-top: 3%
        }

        #place_name, #place_duty {
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
        #div_dept {
            margin-left: 10%;
            margin-top: 20px;
        }
        #dept_label {
            font-family: "Fira Code Medium",serif;
            font-size: 30px;
            color: black
        }
    </style>
    <script type="text/javascript">
        function check() {
            if ($("#place_name").val()=="" || $("#place_duty").val()=="" )
            {     alert("请输入完整信息!");
                return false;
            }
            return true;

        }
        $(function () {
            $("#place_name").blur(function () {
                if ($(this).val() == "") {
                    $(this).siblings("span").text("请输入岗位名称");
                }else {
                    $(this).siblings("span").text("");
                }
            })
            $("#place_duty").blur(function () {
                if ($(this).val() == "") {
                    $(this).siblings("span").text("请输入岗位职责");
                }else {
                    $(this).siblings("span").text("");
                }
            })
        })
    </script>
</head>
<body>
<div id="div_dept">
    <span id="dept_label">${department.getDeptName()}</span>
</div>
<form role="form" id="form_add_place"  onsubmit="return check()" action="../job/addjob">
    <input name="deptid" value="${department.deptId}" style="display: none" readonly />
    <div class="form-group">
        <input type="text" id="place_name" placeholder="岗位名称" name="jobname">
        <span></span>
    </div>
    <div class="form-group">
        <input type="text" id="place_duty" placeholder="岗位职责" name="jobintro">
        <span></span>
    </div>
    <div class="form-group">
        <input type="submit" id="bt_register" value="提交">
        <input type="reset" id="reset" value="重置"></div>
</form>
</body>
</html>
