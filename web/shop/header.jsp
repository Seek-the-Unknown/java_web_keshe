<%--
  Created by IntelliJ IDEA.
  User: xlj
  Date: 2025/4/1
  Time: 19:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>购物网站导航栏</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<header class="header">
    <div class="logo">哪吒购物商城</div>
    <nav class="nav">
        <ul>
            <li><a href="#">首页</a></li>
            <li><a href="#">商品列表</a></li>
            <li><a href="#">购物车</a></li>
        </ul>
    </nav>
    <div class="user-info">
            <a href="${pageContext.request.contextPath}/index.jsp">登录</a>
            <a href="${pageContext.request.contextPath}/register.jsp">注册</a>
    </div>
</header>
</body>
</html>
