<%--
  Created by IntelliJ IDEA.
  User: xlj
  Date: 2025/3/25
  Time: 17:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册页面</title>
</head>
<body>
    <form action="#" method="post">
        <h1>注册页面</h1>
        用户名：<input type="text" name="uname" placeholder="请输入用户名"><br>
        真实姓名：<input type="text" name="rname" placeholder="请输入真实"><br>
        密码：<input type="password" name="password" placeholder="请输入密码"><br>
        确认密码：<input type="password" name="password2" placeholder="请再次输入密码"><br>
        用户角色：<input type="radio" name="role" value="Manager">管理员
        <input type="radio" name="role" value="User">用户<br>
        用户性别：<input type="radio" name="sex" value="1">男
        <input type="radio" name="sex" value="0">女<br>
        <input type="submit" value="注册">
    </form>
</body>
</html>
