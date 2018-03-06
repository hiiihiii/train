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
    <script type="text/javascript" src="${ctxStatic}/jquery/pdata.js"></script>
    <style type="text/css">
        #tab_personinfo{border-collapse: collapse; border: none;width: 90%;height: 70%;text-align: center}
        #tab_personinfo td{border: solid #544f6b 1px;}
        #txt_address{width: 80%}
        #selmarrige{width: 50%}
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
            $("#sub_save").css("left",$("#tab_personinfo").width()/2);
            var html="";
            $("#input_city").append(html);
            $("#input_area").append(html);
            $.each(pdata,function (idx,item) {
                if (parseInt(item.level)==0) {
                    html += "<option value='" + item.names + "'exid='" + item.code + "'>" + item.names + "</option>";
                }
            });
            $("#input_province").append(html);
            $("#input_province").change(function () {
                if ($(this).val()=="")
                    return;
                $("#input_city option").remove();
                $("#input_area option").remove();
                var code = $(this).find("option:selected").attr("exid");
                code = code.substring(0,2);
                var html="";
                $("#input_area").append(html);
                $.each(pdata,function (idx,item) {
                    if (parseInt(item.level)==1 && code == item.code.substring(0,2))
                    {
                        html +="<option value='"+item.names+"'exid='"+item.code+"'>"+item.names+"</option>";
                    }
                });
                $("#input_city").append(html);
            });
            $("#input_city").change(function () {
                if ($(this).val=="") return;
                $("#input_area option").remove();
                var code = $(this).find("option:selected").attr("exid");
                code = code.substring(0,4);
                var html="";
                $.each(pdata,function (idx,item) {
                    if (parseInt(item.level)==2 && code==item.code.substring(0,4))
                    {
                        html+="<option value='"+item.names+"'exid='"+item.code+"'>"+item.names+"</option>";
                    }
                });
                $("#input_area").append(html);
            });
            $("#input_province").val("陕西省");
            $("#input_province").change();
            $("#input_city").val("西安市");
            $("#input_city").change();
            $("#input_area").val("阎良区")
        })

    </script>

    <script type="text/javascript">
        //返回信息
        $('#form_personinfo').ajaxForm({
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
                alert(statusText);
            }
        }
    </script>
</head>

<body style="padding: 10px">
<form action="save" method="post" id="form_personinfo" >
    <div class="con_table">
        <table id="tab_personinfo">
            <tr>
                <td>员工号</td>
                <td id="empid"><input name="empid" value="${empid}" style="border:none" readonly /></td>
                <td>密码</td>
                <td>
                    <input type="password" id="resetpass" name="psw" value="${psw}"/>
                    <span>密码必须大于或等于6位</span>
                </td>
            </tr>
            <tr>
                <td>姓名</td>
                <td id="empname">
                    <input type="text" name="empname" value="${empname}" style="border: none" readonly />
                </td>
                <td>证件号</td>
                <td id="empnum">
                    <input type="text" name="idnum" value="${idnum}" style="border: none" readonly/>
                </td>
            </tr>
            <tr>
                <td>性别</td>
                <td id="empsex">
                    <form:select path="employee.EmpSex" >
                        <form:option value="" label="请选择"/>
                        <form:option value="男">男</form:option>
                        <form:option value="女">女</form:option>
                    </form:select>
                </td>
                <td>婚姻状况</td>
                <td >
                    <form:select path="employee.Marriage" >
                        <form:option value="" label="请选择"/>
                        <form:option value="未婚">未婚</form:option>
                        <form:option value="已婚">已婚</form:option>
                        <form:option value="离婚">离婚</form:option>
                    </form:select>
                </td>
            </tr>
            <tr>
                <td>民族</td>
                <td id="">
                    <input type="text" name="nation" value="${nation}" style="border: none" readonly />
                </td>
                <td>籍贯</td>
                <td>
                    <input type="text" name="birthplace" value="${birthplace}" readonly />
                </td>
            </tr>
            <tr>
                <td>家庭住址</td>
                <td id="address" colspan="3">
                    <input type="text" id="txt_address" name="address" value="${address}" />
                </td>
            </tr>
            <tr>
                <td>联系电话</td>
                <td id="phonenum">
                    <input type="tel" id="in_tel" name="telephone" value="${telephone}"/>
                </td>
                <td>邮箱</td>
                <td id="email">
                    <input type="email" id="in_email" name="email" value="${email}">
                </td>
            </tr>
            <tr>
                <td>开始工作时间</td>
                <td id="start_work_time" colspan="3">
                    <input type="text" name="entrytime" value="${entrytime}" style="border: none" readonly/>
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
