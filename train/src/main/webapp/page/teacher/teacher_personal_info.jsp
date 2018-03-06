<%--
  Created by IntelliJ IDEA.
  User: gy
  Date: 2017/4/19
  Time: 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static"></c:set>

<html>
<head>
    <title>企业员工管理系统</title>

    <script type="text/javascript" src="${ctxStatic}/jquery/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery/bootstrap.min.js"></script>
    <link href="${ctxStatic}/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        /*#tab_teacherinfo{border-collapse: collapse; border: none;width: 90%;height: 70%;text-align: center}*/
        /*#tab_teacherinfo td{border: solid #544f6b 1px;}*/
        #tab_teacherinfo{width: 90%;margin: 20px}
        #sub_save{
            height: 30px;
            width: 100px;
            border-right: solid;
            background-color: lightblue;
            margin-top: 20px;
            position: absolute;
            color: #fff;
            text-align: center}
    </style>
    <script type="text/javascript">
        $(function () {
            $("#sub_save").css("left",$("#tab_teacherinfo").width()/2);
        })

    </script>

    <script type="text/javascript">
        //返回信息
        $('#form_teainfo').ajaxForm({
            success: showResponse //成功返回
        });
        function showResponse(responseText, statusText, xhr, $form){
            console.log(statusText);
            console.log(responseText);
            if(statusText=="success"){
                if(responseText.success==true){
                    alert(responseText.msg);
                }else{
                    alert(responseText.msg);
                }
            }else{
                alertx(statusText);
            }
        }
    </script>
</head>
<body style="padding: 10px">
<form action="save" method="post" id="form_teainfo">
    <div class="con_table">
        <table id="tab_teacherinfo" class="table table-bordered">
            <tr>
                <td>教师号</td>
                <td id="teaid">
                    <input type="text" name="teaid" value="${teaid}" style="border: none" readonly/>
                </td>
                <td>密码</td>
                <td>
                    <input type="password" id="resetpass" name="psw" value="${psw}"/>
                    <span>密码必须大于或等于6位</span>
                </td>
            </tr>
            <tr>
                <td>姓名</td>
                <td id="teaname">
                    <input type="text" name="teaname" value="${teaname}" />
                </td>
                <td>证件号</td>
                <td id="teanum">
                    <input type="text" name="idnum" value="${idnum}" />
                </td>
            </tr>
            <tr>
                <td>性别</td>
                <td id="teasex">
                    <form:select path="teacher.TeaSex" >
                        <form:option value="" label="请选择"/>
                        <form:option value="男">男</form:option>
                        <form:option value="女">女</form:option>
                    </form:select>
                </td>
                <td>职称</td>
                <td id="teatitle">
                    <form:select path="teacher.Title" >
                        <form:option value="" label="请选择"/>
                        <form:option value="讲师">讲师</form:option>
                        <form:option value="副教授">副教授</form:option>
                        <form:option value="教授">教授</form:option>
                    </form:select>
                </td>
            </tr>

            <tr>
                <td>简介</td>
                <td id="address" colspan="3">
                    <textarea id="txt_address" rows="10" cols="100" name="intro">
                        ${intro}
                    </textarea>
                </td>
            </tr>
        </table>
    </div>
    <div>
        <input type="submit" value="保存" id="sub_save"/>
    </div>
</form>
</body>
</html>
