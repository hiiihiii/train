<%--
  Created by IntelliJ IDEA.
  User: gy
  Date: 2017/5/2
  Time: 23:16
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
        #tb_del_dept {
            width: 70%;
            margin: 20px auto 0;
        }
        #tb_all_del_dept {
            width: 70%;
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
            jQuery.page("div_del_dept", 10);
            $("#tb_del_dept tr:not('#tr_th'):odd").css("background-color", "#cccccc");

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
//                   $("table tr td input[type=checkbox]:not('#chkall')").each(function (index) {
//                       if (this.checked){
//                           alert(this.value);
//                       }
//                   });
                   $("#form_del_dept") .submit();
               }
           });
        })

    </script>
</head>
<body>
<form id="form_del_dept" action="../sysuser/deleteDepts" method="post">
    <div id="div_del_dept">
        <table id="tb_del_dept" class="table table-bordered">
            <thead>
            <tr id="tr_th">
                <th width="100px">选项</th>
                <th>部门名称</th>
                <th>编辑</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${departmentList}" var="department" varStatus="status">
                <tr>
                    <td>
                        <input type="checkbox" id="chk" value="${department.deptId}" name="deptid"/>
                    </td>
                    <td>
                        ${department.deptName}
                    </td>
                    <td>
                        <a href="../sysuser/updateInfo?deptid=${department.deptId}">编辑</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div>
        <table id="tb_all_del_dept" class="table table-bordered" >
            <tr>
                <td colspan="2"><input type="checkbox" id="chkall" style="float: left;margin-left: 34px;" /><span style="float: left;margin-left: 10px;">全选</span>
                    <input type="button" value="删除" id="bt_del" style="float: left;margin-left: 10px;"/></td>
            </tr>
        </table>
    </div>
</form>
</body>
</html>

