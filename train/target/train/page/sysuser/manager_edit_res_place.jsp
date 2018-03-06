<%--
  Created by IntelliJ IDEA.
  User: gy
  Date: 2017/5/7
  Time: 13:56
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
        #form_edit_place {
            margin-left: 20%;
            margin-top: 7%
        }

        #place_name, #place_duty {
            width: 300px;
            height: 40px;
        }

        .form-group {
            padding: 10px;
            margin: 2px
        }

        #bt_save, #reset {
            height: 30px;
            width: 80px;
            margin: 20px;
            border-right: solid;
            text-align: center
        }

        #bt_save {
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
            if ($("#place_name").val()=="" || $("#place_duty").val()=="" )
            {     alert("信息不能为空，您可以重置!");
                return false;
            }
            return true;

        }
        $(function () {

            $("#place_name").val(${job.jobName});
            $("#place_duty").val(${job.jobIntro});

            $("#place_name").blur(function () {
                if ($(this).val() == "") {
                    $(this).siblings("span").text("请输入岗位名称");
                }else {
                    $(this).siblings("span").text("");
                }
            });
            $("#place_duty").blur(function () {
                if ($(this).val() == "") {
                    $(this).siblings("span").text("请输入岗位职责");
                }else {
                    $(this).siblings("span").text("");
                }
            });

            $("#reset").click(function () {
                $("#place_name").val(${job.jobName});
                $("#place_duty").val(${job.jobIntro});
            });
        })
    </script>
</head>
<body>

<form role="form" id="form_edit_place"  onsubmit="return check()" action="../job/updateJob">
    <input style="display: none" type="text" name="jobid" value="${job.jobId}" readonly/>
    <div class="form-group">
        <input type="text" id="place_name" placeholder="岗位名称" name="jobname" value="${job.jobName}"><span></span>
    </div>
    <div class="form-group">
        <input type="text" id="place_duty" placeholder="岗位职责" name="jobintro" value="${job.jobIntro}"><span></span>
    </div>
    <div class="form-group">
        <input type="submit" id="bt_save" value="保存">
        <input type="reset" id="reset" value="重置">
    </div>
</form>
</body>
</html>

