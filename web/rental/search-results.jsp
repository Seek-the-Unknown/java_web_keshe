<%--
  Created by IntelliJ IDEA.
  User: Lzs
  Date: 2025/6/12
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>搜索结果</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/shop/style.css">
</head>
<body>
<div class="header">
    <div class="logo">房屋租赁系统</div>
    <div class="nav">
        <ul>
            <li><a href="${pageContext.request.contextPath}/rental/index.jsp">返回首页</a></li>
        </ul>
    </div>
</div>

<div class="main-content">
    <h1>关于 “<c:out value="${searchQuery}"/>” 的搜索结果</h1>

    <%-- 在首页或者所有页面加上搜索框 --%>
    <form action="${pageContext.request.contextPath}/search" method="get" style="text-align: center; margin: 20px;">
        <input type="text" name="location" value="${searchQuery}" placeholder="输入城市或地区搜索..." size="50">
        <button type="submit">重新搜索</button>
    </form>

    <c:if test="${empty searchResults}">
        <p style="text-align: center;">没有找到相关的房源。请尝试其他关键词。</p>
    </c:if>

    <div class="product-grid">
        <c:forEach var="house" items="${searchResults}">
            <div class="product-card">
                <h3><c:out value="${house.title}"/></h3>
                <p><strong>位置:</strong> <c:out value="${house.city}"/></p>
                <p class="price">￥${house.price}/月</p>
                <a href="#" class="add-to-cart">查看详情</a>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>