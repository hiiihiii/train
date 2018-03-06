<%--
  Created by IntelliJ IDEA.
  User: gy
  Date: 2017/5/9
  Time: 17:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static"></c:set>
<%
    int id = 0;
%>
<html>
<head>
    <title>企业员工培训管理系统</title>
    <script type="text/javascript" src="${ctxStatic}/jquery/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery/page.js"></script>
    <link href="${ctxStatic}/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        #tb_del_staff {
            width: 90%;
            margin: 20px auto 0;
        }
        #tb_all_del_staff {
            width: 90%;
            margin: 0 auto 20px;
        }

        .table tr th {
            height: 50px;
            background-color: lightblue
        }

        .table th, .table td {
            text-align: center;
            vertical-align: middle !important;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $("#tb_del_staff tr:not('#tr_th'):odd").css("background-color", "#cccccc");

            $("#chkall").click(function () {
                if (this.checked){
                    $("table tr td input[type=checkbox]").attr("checked",true);
                }else {
                    $("table tr td input[type=checkbox]").attr("checked",false);
                }
            });

            $("#bt_del").click(function () {
                var len = $("table tr td input[type=checkbox]:not('#chkall')").length;
                if (len!=0){
                    $("#form_del_staff") .submit();
                }
            });
        })
    </script>
</head>
<body>
<form id="form_del_staff" action="../employee/deleteEmpBat" method="post">
    <div id="div_del_staff">
        <table id="tb_del_staff" class="table table-bordered">
            <thead>
            <tr id="tr_th">
                <th width="100px">选项</th>
                <th>员工姓名</th>
                <th>证件号</th>
                <th>性别</th>
                <th>民族</th>
                <th>籍贯</th>
            </tr>
            </thead>
            <tbody>
            <c:if test="${employees.size()==0}">
                <td colspan="6">还没有员工，请<a href="../sysuser/manager_add_staff.jsp">添加</a> </td>
            </c:if>
            <c:if test="${employees.size()!=0}">
                <c:forEach items="${employees}" var="employee">
                <tr>
                    <td>
                        <input type="checkbox" id="chk" name="empid" value="${employee.empId}"/>
                    </td>
                    <td>${employee.empName}</td>
                    <td>${employee.idNum}</td>
                    <td>${employee.empSex}</td>
                    <td>${employee.nation}</td>
                    <td>${employee.birthPlace}</td>
                </tr>
                </c:forEach>
            </c:if>
            </tbody>
        </table>
    </div>
    <div>
        <table id="tb_all_del_staff" class="table table-bordered">
            <tr>
                <td colspan="2"><input type="checkbox" id="chkall" style="float: left;margin-left: 34px;"/><span
                        style="float: left;margin-left: 10px;">全选</span>
                    <input type="button" value="删除" id="bt_del" style="float: left;margin-left: 10px;"/>
                </td>
            </tr>
        </table>
    </div>
</form>
</body>
</html>

