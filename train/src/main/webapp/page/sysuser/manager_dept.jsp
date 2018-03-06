<%--
  Created by IntelliJ IDEA.
  User: gy
  Date: 2017/5/2
  Time: 19:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static"></c:set>

<html>
<head>
    <title>企业员工培训管理系统</title>
    <style type="text/css">
        #div_manage_dept{width:50%;margin: 10% auto}
        a{padding: 20px;font-size: 20px;font-family: "楷体",serif;color: #31708f}
    </style>
</head>
<body>
<div id="div_manage_dept">
    <a href="manager_add_dept.jsp">增加部门</a>
    <a href="manager_del_dept.jsp">删除部门</a>
    <a href="manager_edit_dept.jsp">修改部门</a>
    <a href="manager_check_dept.jsp">查看部门</a>
</div>

</body>
</html>
