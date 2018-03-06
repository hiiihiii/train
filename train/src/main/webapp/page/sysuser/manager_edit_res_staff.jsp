<%--
  Created by IntelliJ IDEA.
  User: gy
  Date: 2017/5/9
  Time: 17:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static"></c:set>
<%--<%--%>
    <%--String staff_name = request.getParameter("name");--%>
    <%--String staff_num = request.getParameter("num");--%>
<%--//    String sex = request.getParameter("sex");--%>
    <%--String sex = "male";--%>
    <%--String marriage = request.getParameter("marriage");--%>
    <%--String nation = request.getParameter("nation");--%>
    <%--String province = request.getParameter("province");--%>
    <%--String city = request.getParameter("city");--%>
    <%--String area = request.getParameter("area");--%>

    <%--String address = request.getParameter("address");--%>
    <%--String telenum = request.getParameter("telenum");--%>
    <%--String email = request.getParameter("email");--%>
    <%--String start_date = request.getParameter("startdate");--%>

<%--%>--%>
<html>
<head>
    <title>企业员工培训管理系统</title>
    <script type="text/javascript" src="${ctxStatic}/jquery/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery/page.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery/pdata.js"></script>
    <link href="${ctxStatic}/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        #form_edit_staff {
            margin-left: 20%;
            margin-top: 2%
        }

        #staff_name, #sel_dept, #start_date, #staff_num, #selmarriage, #nation, #txt_address, #in_tel, #in_email,#selsex {
            width: 300px;
            height: 40px;
        }

        #input_province, #input_city, #input_area {
            height: 40px;
        }

        #sex_female, #sex_male {
            width: 40px
        }

        .form-group {
            margin: 8px
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

        .func {
            margin-top: 18px;
        }
    </style>
    <script type="text/javascript">
        var national = [
            "汉族", "壮族", "满族", "回族", "苗族", "维吾尔族", "土家族", "彝族", "蒙古族", "藏族", "布依族", "侗族", "瑶族", "朝鲜族", "白族", "哈尼族",
            "哈萨克族", "黎族", "傣族", "畲族", "傈僳族", "仡佬族", "东乡族", "高山族", "拉祜族", "水族", "佤族", "纳西族", "羌族", "土族", "仫佬族", "锡伯族",
            "柯尔克孜族", "达斡尔族", "景颇族", "毛南族", "撒拉族", "布朗族", "塔吉克族", "阿昌族", "普米族", "鄂温克族", "怒族", "京族", "基诺族", "德昂族", "保安族",
            "俄罗斯族", "裕固族", "乌孜别克族", "门巴族", "鄂伦春族", "独龙族", "塔塔尔族", "赫哲族", "珞巴族"
        ];
        function check() {
            var isNum = /^[0-9]+$/;
            var isMobile=/^1\d{10}$/;
            var isEmail = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
            if ($("#staff_name").val() == "" || $("#txt_address").val() == "") {
                alert("请输入完整信息!");
                return false;
            }else if (!isNum.test($("#staff_num").val())){
                alert("请输入正确的证件号!");
                return false;
            }else if (!isMobile.test($("#in_tel").val())){
                alert("请输入正确的电话号码!");
                return false;
            }else if (!isEmail.test($("#in_email").val())){
                alert("请输入正确的电子邮箱!");
                return false;
            }
            return true;

            }
            $(function () {

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

                for(var i=0;i<national.length;i++){
                    var nat = national[i];
                    $("#nation").append('<option value="'+nat+'">'+nat+'</option>');
                }

                $("#staff_name").blur(function () {
                    if ($(this).val() == "") {
                        $(this).siblings("span").text("请输入员工姓名");
                    } else {
                        $(this).siblings("span").text("");
                    }
                });
                $("#staff_num").blur(function () {
                    var isNum = /^[0-9]+$/;
                    if (!isNum.test($(this).val())) {
                        $(this).siblings("span").text("请输入正确的证件号");
                    } else {
                        $(this).siblings("span").text("");
                    }
                });
                $("#txt_address").blur(function () {
                    if ($(this).val() == "") {
                        $(this).siblings("span").text("请输入家庭住址");
                    } else {
                        $(this).siblings("span").text("");
                    }
                });
                $("#in_tel").blur(function () {
                    var isMobile=/^1\d{10}$/;
                    if (!isMobile.test($(this).val())){
                        $(this).siblings("span").text("请输入正确的联系电话");
                        $(this).val("");
                    } else {
                        $(this).siblings("span").text("");
                    }
                });
                $("#in_email").blur(function () {
                    var isEmail = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
                    if (!isEmail.test($(this).val())) {
                        $(this).siblings("span").text("请输入正确的邮箱");
                    } else {
                        $(this).siblings("span").text("");
                    }
                });


                $("#staff_name").val(${employee.empName});
                $("#staff_num").val(${employee.idNum});

                $("#selsex").val(${employee.empSex})
                $("#selmarriage").val(${employee.marriage});
                $("#nation").val(${employee.nation});

                <%--$("#input_province").val(<%=province%>);--%>
                <%--$("#input_province").change();--%>
                <%--$("#input_city").val(<%=city%>);--%>
                <%--$("#input_city").change();--%>
                <%--$("#input_area").val(<%=area%>);--%>

                $("#txt_address").val(${employee.address});
                $("#in_tel").val(${employee.telephone});
                $("#in_email").val(${employee.email});
                $("#start_date").val(${employee.entryTime});




                $("#reset").click(function () {
                    $("#staff_name").val(${employee.empName});
                    $("#staff_num").val(${employee.idNum});

                    $("#selsex").val(${employee.empSex})
                    $("#selmarriage").val(${employee.marriage});
                    $("#nation").val(${employee.nation});

                    <%--$("#input_province").val(<%=province%>);--%>
                    <%--$("#input_province").change();--%>
                    <%--$("#input_city").val(<%=city%>);--%>
                    <%--$("#input_city").change();--%>
                    <%--$("#input_area").val(<%=area%>);--%>

                    $("#txt_address").val(${employee.address});
                    $("#in_tel").val(${employee.telephone});
                    $("#in_email").val(${employee.email});
                    $("#start_date").val(${employee.entryTime});
                });

            });

    </script>
</head>
<body>
<form role="form" id="form_edit_staff" onsubmit="return check()">
    <input name="empid" value="${employee.empId}" style="display: none"/>
    <div class="form-group">
        <input type="text" id="staff_name" placeholder="员工姓名" name="empname" value="${employee.empName}"><span></span>
    </div>
    <div class="form-group">
        <input type="text" id="staff_num" placeholder="证件号" name="idnum" value="${employee.idNum}">
        <span></span>
    </div>
    <div class="form-group">
        <form:select path="employee.EmpSex" id="selsex">
            <form:option value="" label="请选择"/>
            <form:option value="男">男</form:option>
            <form:option value="女">女</form:option>
        </form:select>
    </div>
    <div class="form-group">
        <form:select path="employee.Marriage" id="selmarriage">
            <form:option value="" label="请选择"/>
            <form:option value="未婚" >未婚</form:option>
            <form:option value="已婚">已婚</form:option>
            <form:option value="离婚">离婚</form:option>
        </form:select>
    </div>
    <div class="form-group">
        <form:select path="employee.Nation" id="nation">
            <form:option value="" label="请选择"/>
        </form:select>
    </div>
    <div class="form-group">
        <%--<input type="text" id="staff_name" placeholder="籍贯" name="nation" value="${employee.Nation}"><span></span>--%>
        <select id="input_province" title="籍贯"></select>
        <select id="input_city" title="籍贯"></select>
        <select id="input_area" title="籍贯"></select>
    </div>
    <div class="form-group">
        <input type="text" id="txt_address" placeholder="家庭住址" name="address" value="${employee.address}"/><span></span>
    </div>
    <div class="form-group">
        <input type="text" id="in_tel" placeholder="11位电话号码" name="telephone" value="${employee.telephone}"/><span></span>
    </div>
    <div class="form-group">
        <input type="text" id="in_email" placeholder="邮箱" name="email" value="${employee.email}"><span></span>
    </div>
    <div class="form-group">
        <input type="date" id="start_date" name="entrytime" title="开始工作时间" value="${employee.entryTime}"/><span></span>
    </div>
    <div class="form-group">
        <form:select path="employee.DeptId" id="sel_dept">
            <option value="请选择" selected>请选择</option>
            <form:options items="${departments}" itemLabel="DeptName" itemValue="DeptId"></form:options>
        </form:select>
    </div>
    <div class="func"><input type="submit" id="bt_register" value="提交">
        <input type="reset" id="reset" value="重置"></div>
</form>
</body>
</html>