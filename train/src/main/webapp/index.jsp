<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<h2>Hello World!</h2>
<!-- action应该映射到Controller中具体的方法的RequestMapping上 -->
<!-- 注意action这个路径，一点都不能出错 -->
<form action="user/login" method="post">
    <p>
        用户名: <input type="text" name="username" id = "username"/>
    </p>
    <p>
        密码: <input type="password" name="psw" id = "psw"/>
    </p>
    <input type="submit" value="提交" />
</form>
</body>
</html>
