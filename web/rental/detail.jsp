<%--
  Created by IntelliJ IDEA.
  User: Lzs
  Date: 2025/4/28
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>房屋租赁系统</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Microsoft YaHei', sans-serif;
        }

        body {
            background-color: #f5f5f5;
        }

        /* 顶部标题栏 */
        .header {
            background-color: #8B4513; /* 棕色 */
            color: white;
            padding: 15px 0;
            text-align: center;
            font-size: 24px;
        }

        /* 导航栏 */
        .navbar {
            background-color: #333; /* 深灰色 */
            padding: 10px 0;
        }

        .nav-list {
            display: flex;
            justify-content: center;
            list-style: none;
            max-width: 1200px;
            margin: 0 auto;
        }

        .nav-item {
            color: white;
            padding: 5px 15px;
            cursor: pointer;
        }

        .nav-item:hover {
            background-color: #555;
        }

        /* 横幅图 */
        .banner {
            height: 300px;
            background-color: #ddd;
            background-image: url('../images/0527.jpg_wh860.jpg');
            background-size: cover;
            background-position: center;
            margin-bottom: 20px;
        }

        /* 筛选按钮区域 */
        .filter-section {
            max-width: 1200px;
            margin: 0 auto 20px;
            padding: 0 20px;
        }

        .filter-title {
            font-size: 18px;
            margin-bottom: 10px;
        }

        .filter-buttons {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }

        .filter-btn {
            padding: 5px 15px;
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 4px;
            cursor: pointer;
        }

        .filter-btn.active {
            background-color: #8B4513;
            color: white;
        }

        /* 房屋信息标题 */
        .house-title {
            max-width: 1200px;
            margin: 0 auto 20px;
            padding: 0 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .house-label {
            color: red;
            font-size: 20px;
            font-weight: bold;
        }

        .search-box {
            padding: 5px 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        /* 房屋展示 */
        .house-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
        }

        .house-item {
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .house-img {
            height: 180px;
            background-color: #eee;
            background-size: cover;
            background-position: center;
        }

        .house-name {
            padding: 10px;
            text-align: center;
        }

        /* 底部 */
        .footer {
            margin-top: 30px;
            padding: 20px;
            text-align: center;
            background-color: #333;
            color: white;
        }
    </style>
</head>
<body>
<!-- 顶部标题栏 -->
<div class="header">房屋租赁系统</div>

<!-- 导航栏 -->
<nav class="navbar">
    <ul class="nav-list">
        <a href="index.jsp"><li class="nav-item">首页</li></a>
        <a><li class="nav-item">房屋信息</li></a>
        <a><li class="nav-item">我要当房主</li></a>
        <a><li class="nav-item">公告信息</li></a>
        <a><li class="nav-item">留言反馈</li></a>
        <a><li class="nav-item">个人中心</li></a>
        <a><li class="nav-item">后台管理</li></a>>
    </ul>
</nav>

<!-- 横幅图 -->
<div class="banner"></div>

<!-- 筛选按钮区域 -->
<div class="filter-section">
    <div class="filter-title">房屋类型</div>
    <div class="filter-buttons">
        <div class="filter-btn active">全部</div>
        <div class="filter-btn">3房1厅</div>
        <div class="filter-btn">房屋类型1</div>
        <div class="filter-btn">房屋类型2</div>
        <div class="filter-btn">房屋类型3</div>
    </div>
</div>

<!-- 房屋信息标题 -->
<div class="house-title">
    <div class="house-label">房屋信息</div>
    <input type="text" class="search-box" placeholder="搜索...">
</div>

<!-- 房屋展示 -->
<div class="house-container">
    <div class="house-item">
        <div class="house-img" style="background-image: url('../images/fsd.jpg');"></div>
        <div class="house-name">房屋名称1</div>
    </div>
    <div class="house-item">
        <div class="house-img" style="background-image: url('../images/OIP-C.jpg');"></div>
        <div class="house-name">房屋名称2</div>
    </div>
    <div class="house-item">
        <div class="house-img" style="background-image: url('../images/4326.jpg_wh860.jpg');"></div>
        <div class="house-name">房屋名称3</div>
    </div>
    <div class="house-item">
        <div class="house-img" style="background-image: url('../images/0527.jpg_wh860.jpg');"></div>
        <div class="house-name">房屋名称4</div>
    </div>
</div>

<!-- 底部 -->
<div class="footer">
    <p>© 2023 房屋租赁系统</p>
</div>
</body>
</html>