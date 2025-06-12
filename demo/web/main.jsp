<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.User" %>
<html>
<head>
    <title>欢迎页面</title>
</head>
<body>
    <h1>欢迎来到三江学院学生管理系统</h1>
    <p>当前用户：${sessionScope.currentUser.username}</p>
    <a href="${pageContext.request.contextPath}/logout">退出登录</a>
</body>
</html>