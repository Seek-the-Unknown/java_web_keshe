<%--&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: Lzs--%>
<%--  Date: 2025/6/12--%>
<%--  Time: 15:59--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>

<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>发布新房源</title>--%>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/shop/style.css">--%>
<%--</head>--%>
<%--<body>--%>
<%--&lt;%&ndash; 建议包含一个公共的头部文件 &ndash;%&gt;--%>
<%--<div class="header">--%>
<%--    <div class="logo">房屋租赁系统</div>--%>
<%--    <div class="nav">--%>
<%--        <ul>--%>
<%--            <li><a href="${pageContext.request.contextPath}/rental/index.jsp">返回首页</a></li>--%>
<%--        </ul>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<div class="main-content">--%>
<%--    &lt;%&ndash; JSTL技术应用: 判断用户是否登录 &ndash;%&gt;--%>
<%--    <c:if test="${empty sessionScope.currentUser}">--%>
<%--        <h2 style="text-align: center; color: red;">请先<a href="${pageContext.request.contextPath}/index.jsp">登录</a>后再发布房源！</h2>--%>
<%--    </c:if>--%>

<%--    <c:if test="${not empty sessionScope.currentUser}">--%>
<%--        <h1>填写您的房源信息</h1>--%>
<%--        &lt;%&ndash; 注意 form 的 action 和 enctype &ndash;%&gt;--%>
<%--        <form action="${pageContext.request.contextPath}/HousePostServlet" method="post" enctype="multipart/form-data" style="width: 50%; margin: 20px auto; padding: 20px; border: 1px solid #ccc; border-radius: 5px;">--%>
<%--            <p><strong>标题:</strong> <input type="text" name="title" required style="width: 100%;"></p>--%>
<%--            <p><strong>户型:</strong> <input type="text" name="type" placeholder="例如：三室一厅" required style="width: 100%;"></p>--%>
<%--            <p><strong>价格 (元/月):</strong> <input type="number" name="price" required style="width: 100%;"></p>--%>
<%--            <p><strong>卧室数量:</strong> <input type="number" name="bedrooms" value="1" required style="width: 100%;"></p>--%>

<%--            <p><strong>卫生间数量:</strong> <input type="number" name="bathrooms" value="1" required style="width: 100%;"></p>--%>
<%--            <p><strong>面积 (平方米):</strong> <input type="number" step="0.01" name="area" placeholder="例如: 88.88" required style="width: 100%;"></p>--%>
<%--            --%>
<%--            <p><strong>城市:</strong> <input type="text" name="city" placeholder="例如：上海" required style="width: 100%;"></p>--%>
<%--            <p><strong>详细地址:</strong> <input type="text" name="address" required style="width: 100%;"></p>--%>
<%--            <p><strong>详细描述:</strong> <textarea name="description" rows="5" style="width: 100%;"></textarea></p>--%>
<%--            <p><strong>房源图片 (可多选):</strong> <input type="file" name="images" multiple accept="image/*"></p>--%>
<%--            <p><button type="submit" class="checkout">确认发布</button></p>--%>
<%--        </form>--%>
<%--    </c:if>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>发布新房源</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/shop/style.css">
</head>
<body>
<%--<div class="header">--%>
<%--    <div class="logo">房屋租赁系统</div>--%>
<%--    <div class="nav">--%>
<%--        <ul>--%>
<%--            <li><a href="${pageContext.request.contextPath}/">返回首页</a></li>--%>
<%--        </ul>--%>
<%--    </div>--%>
<%--</div>--%>
<%@ include file="/jspf/header.jspf" %>

<div class="main-content">
    <c:if test="${empty sessionScope.currentUser}">
        <h2 style="text-align: center; color: red;">请先<a href="${pageContext.request.contextPath}/index.jsp">登录</a>后再发布房源！</h2>
    </c:if>

    <c:if test="${not empty sessionScope.currentUser}">
        <h1>填写您的房源信息</h1>
        <form action="${pageContext.request.contextPath}/HousePostServlet" method="post" enctype="multipart/form-data" style="width: 50%; margin: 20px auto; padding: 20px; border: 1px solid #ccc; border-radius: 5px;">
            <p><strong>标题:</strong> <input type="text" name="title" required style="width: 100%;"></p>
            <p><strong>户型:</strong> <input type="text" name="houseType" placeholder="例如：三室一厅" required style="width: 100%;"></p>
            <p><strong>价格 (元/月):</strong> <input type="number" name="price" required style="width: 100%;"></p>
            <p><strong>卧室数量:</strong> <input type="number" name="bedrooms" value="1" required style="width: 100%;"></p>
            <p><strong>卫生间数量:</strong> <input type="number" name="bathrooms" value="1" required style="width: 100%;"></p>
            <p><strong>面积 (平方米):</strong> <input type="number" step="0.01" name="area" placeholder="例如: 88.88" required style="width: 100%;"></p>
            <p><strong>城市:</strong> <input type="text" name="city" placeholder="例如：上海" required style="width: 100%;"></p>
            <p><strong>详细地址:</strong> <input type="text" name="address" required style="width: 100%;"></p>
            <p><strong>详细描述:</strong> <textarea name="description" rows="5" style="width: 100%;"></textarea></p>
            <p><strong>房源图片 (可多选):</strong> <input type="file" name="images" multiple accept="image/*"></p>
            <p><button type="submit" class="checkout">确认发布</button></p>
        </form>
    </c:if>
</div>
</body>
</html>
<%@ include file="/jspf/footer.jspf" %>