<%-- 确保这行在文件的最顶部 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%--
  引入页头。
  注意：强烈建议将 jspf 文件夹放在 WEB-INF 目录下，以防止用户直接访问。
  如果您的 jspf 文件夹在 WEB-INF 下，路径应该是 /WEB-INF/jspf/header.jspf
--%>
<%@ include file="/jspf/header.jspf" %>

<%-- 为这个特定页面添加独有的CSS样式 --%>
<style>
    /* 1. 横幅和搜索框样式 */
    .hero { height: 500px; background: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.3)), url('${pageContext.request.contextPath}/images/pexels-pixabay-271624.jpg') center/cover; display: flex; flex-direction: column; justify-content: center; align-items: center; color: white; text-align: center; padding: 0 20px; }
    .hero-title { font-size: 42px; margin-bottom: 20px; font-weight: 600; }
    .hero-subtitle { font-size: 18px; margin-bottom: 30px; max-width: 700px; line-height: 1.5; }

    /* --- 这是美化后的搜索框CSS --- */
    .hero-search-form {
        display: flex;
        width: 100%;
        max-width: 600px;
        background-color: white;
        border-radius: 50px; /* 圆角边框 */
        padding: 5px;
        box-shadow: 0 5px 15px rgba(0,0,0,0.2);
    }
    .hero-search-form input {
        flex-grow: 1; /* 让输入框占据剩余所有空间 */
        padding: 10px 20px;
        border: none;
        outline: none;
        font-size: 16px;
        background: transparent;
    }
    .hero-search-form button {
        background: #0066ff;
        color: white;
        border: none;
        border-radius: 50px; /* 圆角按钮 */
        padding: 10px 25px;
        cursor: pointer;
        font-size: 16px;
        display: flex;
        align-items: center;
        gap: 8px; /* 图标和文字的间距 */
        transition: background 0.3s;
    }
    .hero-search-form button:hover {
        background: #0052cc;
    }
    /* --- 搜索框CSS结束 --- */

    /* 2. 页面主要内容和房源卡片布局样式 */
    .container { max-width: 1200px; margin: 50px auto; padding: 0 20px; flex: 1; }
    .section-title { font-size: 28px; margin-bottom: 30px; color: #222; }

    /* --- 这是确保横向排列的核心布局样式 --- */
    .apartments-grid {
        display: flex;
        flex-wrap: wrap;
        gap: 25px; /* 卡片间距 */
    }
    .apartment-card {
        flex: 1 1 270px; /* 弹性布局，基础宽度270px，允许伸缩 */
        background: white;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        transition: transform 0.3s;
        display: flex;
        flex-direction: column;
    }
    .apartment-card:hover { transform: translateY(-5px); }
    .apartment-img { height: 200px; background-size: cover; background-position: center; }
    .apartment-info { padding: 20px; display: flex; flex-direction: column; flex-grow: 1; }
    .apartment-name { font-size: 18px; font-weight: 600; margin-bottom: 8px; }
    .apartment-address { color: #666; font-size: 14px; margin-bottom: 12px; }
    .apartment-specs { color: #444; font-size: 15px; margin-bottom: 15px; }
    .apartment-price { color: #0066ff; font-weight: bold; font-size: 16px; }
    .rent-form { margin-top: auto; }
    .rent-button { width: 100%; background: #0066ff; color: white; border: none; padding: 10px 20px; border-radius: 5px; font-size: 15px; cursor: pointer; transition: background 0.3s; }
    .rent-button:hover { background: #0052cc; }
</style>

<section class="hero">
    <h1 class="hero-title">发现您的新家</h1>
    <p class="hero-subtitle">已帮助1亿租客找到他们的理想住所</p>
    <form action="${pageContext.request.contextPath}/search" method="get" class="hero-search-form">
        <input type="text" name="location" placeholder="输入城市、区域或小区开始搜索...">
        <button type="submit">
            <i class="fas fa-search"></i>
            <span>搜索</span>
        </button>
    </form>
</section>

<div class="container">
    <h2 class="section-title">探索可租赁的优质房源</h2>
    <div class="apartments-grid">
        <c:if test="${empty availableHouseList}">
            <%-- 注意：p标签不适用于grid-column，在flex布局下此样式无效，直接显示即可 --%>
            <p style="width: 100%; text-align: center;">抱歉，当前没有可供租赁的房源。</p>
        </c:if>
        <c:forEach var="house" items="${availableHouseList}">
            <div class="apartment-card">
                <c:set var="imagePath" value="images/default-house.png" />
                <c:if test="${not empty house.imagePaths}">
                    <c:set var="images" value="${fn:split(house.imagePaths, ',')}" />
                    <c:set var="imagePath" value="${images[0]}" />
                </c:if>
                <div class="apartment-img" style="background-image: url('${pageContext.request.contextPath}/${imagePath}');"></div>
                <div class="apartment-info">
                    <h3 class="apartment-name"><c:out value="${house.title}" /></h3>
                    <p class="apartment-address"><c:out value="${house.city}, ${house.address}"/></p>
                    <p class="apartment-specs">${house.bedrooms}室 | ${house.bathrooms}卫 | ${house.area} m²</p>
                    <p class="apartment-price">￥${house.price} / 月</p>
                    <form class="rent-form" action="${pageContext.request.contextPath}/rental/rent" method="post">
                        <input type="hidden" name="houseId" value="${house.id}">
                        <button type="submit" class="rent-button" onclick="return confirm('您确定要租赁《${fn:escapeXml(house.title)}》吗？');">
                            立即租赁
                        </button>
                    </form>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<%-- 引入页脚 --%>
<%@ include file="/jspf/footer.jspf" %>