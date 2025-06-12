<%--
  Created by IntelliJ IDEA.
  User: xlj
  Date: 2025/4/1
  Time: 19:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>购物网站主体内容</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<jsp:include page="header.jsp"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="main-content">
    <div class="banner">
        <h1>欢迎来到哪吒购物商城</h1>
        <p>精选优质商品，享受购物乐趣</p>
    </div>

    <div class="featured-products">
        <h2>热门推荐</h2>
        <div class="product-grid">
            <div class="product-card">
                <img src="${pageContext.request.contextPath}/images/product1.jpg" alt="儿童蛋糕">
                <h3>【欢乐家园】儿童水果蛋糕</h3>
                <p>¥89.00</p>
				<a class="add-to-cart">查看详情</a>
                <a class="add-to-cart" href="#">加入购物车</a>
            </div>
            <div class="product-card">
                <img src="${pageContext.request.contextPath}/images/product2.jpg" alt="曲奇饼干">
               <h3>【黄油曲奇】曲奇饼干奶香</h3>
                <p>¥39.00</p>
				<a class="add-to-cart">查看详情</a>
                <a class="add-to-cart" href="#">加入购物车</a>
           </div>
           <div class="product-card">
                <img src="${pageContext.request.contextPath}/images/product3.jpg" alt="芝士糕点">
                <h3>【玫瑰芝士】芝士糕点鲜花</h3>
                <p>¥49.00</p>
				<a class="add-to-cart">查看详情</a>
                <a class="add-to-cart" href="#">加入购物车</a>
            </div>
        </div>
    </div>
</div>
<jsp:include page="foot.jsp"/>
</body>
</html>
