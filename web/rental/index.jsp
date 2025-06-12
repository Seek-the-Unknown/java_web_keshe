<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>公寓租房网</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Helvetica Neue', Arial, sans-serif;
        }

        body {
            background-color: #f8f9fa;
            color: #333;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* 顶部导航栏 */
        .top-nav {
            background-color: white;
            padding: 15px 5%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .nav-left, .nav-right {
            display: flex;
            align-items: center;
            gap: 25px;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            color: #0066ff;
        }

        .nav-link {
            color: #555;
            text-decoration: none;
            font-size: 15px;
        }

        .language-selector {
            color: #777;
            font-size: 14px;
        }

        /* 横幅区域 */
        .hero {
            height: 500px;
            background: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.3)),
            url('${pageContext.request.contextPath}/images/pexels-pixabay-271624.jpg') center/cover;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            color: white;
            text-align: center;
            padding: 0 20px;
        }

        .hero-title {
            font-size: 42px;
            margin-bottom: 20px;
            font-weight: 600;
        }

        .hero-subtitle {
            font-size: 18px;
            margin-bottom: 30px;
            max-width: 700px;
            line-height: 1.5;
        }

        .search-container {
            display: flex;
            width: 100%;
            max-width: 600px;
        }

        .search-box {
            flex: 1;
            padding: 15px 20px;
            border-radius: 30px 0 0 30px;
            border: none;
            font-size: 16px;
            outline: none;
        }

        .search-button {
            background: #0066ff;
            color: white;
            border: none;
            border-radius: 0 30px 30px 0;
            padding: 0 20px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: background 0.3s;
        }

        .search-button:hover {
            background: #0052cc;
        }

        .search-icon {
            font-size: 20px;
        }

        /* 公寓展示区 */
        .container {
            max-width: 1200px;
            margin: 50px auto;
            padding: 0 20px;
            flex: 1;
        }

        .section-title {
            font-size: 28px;
            margin-bottom: 30px;
            color: #222;
        }

        .apartments-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 25px;
        }

        .apartment-card {
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
            transition: transform 0.3s;
        }

        .apartment-card:hover {
            transform: translateY(-5px);
        }

        .apartment-img {
            height: 200px;
            background-size: cover;
            background-position: center;
        }

        .apartment-info {
            padding: 20px;
        }

        .apartment-name {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 8px;
        }

        .apartment-address {
            color: #666;
            font-size: 14px;
            margin-bottom: 12px;
        }

        .apartment-specs {
            color: #444;
            font-size: 15px;
            margin-bottom: 15px;
        }

        .apartment-price {
            color: #0066ff;
            font-weight: bold;
            font-size: 16px;
        }

        /* 查看更多按钮 */
        .view-more {
            display: block;
            text-align: center;
            margin-top: 40px;
        }

        .view-more-btn {
            background: #0066ff;
            color: white;
            border: none;
            padding: 12px 30px;
            border-radius: 30px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s;
        }

        .view-more-btn:hover {
            background: #0052cc;
        }

        /* 页脚样式 */
        footer {
            background-color: #2c3e50;
            color: #ecf0f1;
            padding: 60px 0 30px;
            margin-top: 50px;
        }

        .footer-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 30px;
        }

        .footer-column h3 {
            font-size: 18px;
            margin-bottom: 20px;
            position: relative;
            padding-bottom: 10px;
        }

        .footer-column h3::after {
            content: '';
            position: absolute;
            left: 0;
            bottom: 0;
            width: 40px;
            height: 2px;
            background-color: #0066ff;
        }

        .footer-column ul {
            list-style: none;
        }

        .footer-column li {
            margin-bottom: 12px;
        }

        .footer-column a {
            color: #bdc3c7;
            text-decoration: none;
            transition: color 0.3s;
        }

        .footer-column a:hover {
            color: #0066ff;
        }

        .social-links {
            display: flex;
            gap: 15px;
            margin-top: 20px;
        }

        .social-links a {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background-color: #34495e;
            color: #ecf0f1;
            transition: all 0.3s;
        }

        .social-links a:hover {
            background-color: #0066ff;
            transform: translateY(-3px);
        }

        .copyright {
            text-align: center;
            padding-top: 30px;
            margin-top: 30px;
            border-top: 1px solid #34495e;
            color: #7f8c8d;
            font-size: 14px;
        }
    </style>
    <!-- 引入Font Awesome图标库 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
<!-- 顶部导航栏 -->
<nav class="top-nav">
    <div class="nav-left">
        <span class="language-selector">中文</span>
        <div class="logo">公寓租房网</div>
    </div>
    <div class="nav-right">
        <a href="#" class="nav-link">管理租房</a>
        <a href="${pageContext.request.contextPath}/register.jsp" class="nav-link">登录/注册</a>
        <a href="${pageContext.request.contextPath}/rental/house_location.jsp" class="nav-link">发布房源</a>
    </div>
</nav>

<!-- 横幅区域 -->
<section class="hero">
    <h1 class="hero-title">发现您的新家</h1>
    <p class="hero-subtitle">已帮助1亿租客找到他们的理想住所</p>
    <form action="search.jsp" method="get" class="search-container">
        <input type="text" name="query" class="search-box" placeholder="芝加哥, 伊利诺伊州" required>
        <button type="submit" class="search-button">
            <i class="fas fa-search search-icon"></i>
        </button>
    </form>
</section>

<!-- 公寓展示区 -->
<div class="container">
    <h2 class="section-title">探索芝加哥, 伊利诺伊州的出租公寓</h2>

    <div class="apartments-grid">
        <!-- 公寓1 -->
        <div class="apartment-card">
            <div class="apartment-img" style="background-image: url('${pageContext.request.contextPath}/images/download.jpg');"></div>
            <div class="apartment-info">
                <h3 class="apartment-name">总统大厦</h3>
                <p class="apartment-address">555 W Madison St.<br>芝加哥, IL 60661</p>
                <p class="apartment-specs">单间 - 2室 | $1,635 - $9,340</p>
            </div>
        </div>

        <!-- 公寓2 -->
        <div class="apartment-card">
            <div class="apartment-img" style="background-image: url('${pageContext.request.contextPath}/images/download2.jpg');"></div>
            <div class="apartment-info">
                <h3 class="apartment-name">新城市公寓</h3>
                <p class="apartment-address">1457 N Holsted St.<br>芝加哥, IL 60642</p>
                <p class="apartment-specs">单间 - 2室 | $1,635 - $9,340</p>
            </div>
        </div>

        <!-- 公寓3 -->
        <div class="apartment-card">
            <div class="apartment-img" style="background-image: url('${pageContext.request.contextPath}/images/pexels-curtis-adams-1694007-4469132.jpg');"></div>
            <div class="apartment-info">
                <h3 class="apartment-name">MILA公寓</h3>
                <p class="apartment-address">201N Gorland Ct.<br>芝加哥, IL 60601</p>
                <p class="apartment-specs">单间 - 4室 | $2,105 - $11,500</p>
            </div>
        </div>

        <!-- 公寓4 -->
        <div class="apartment-card">
            <div class="apartment-img" style="background-image: url('${pageContext.request.contextPath}/images/OIP-C.jpg');"></div>
            <div class="apartment-info">
                <h3 class="apartment-name">密歇根大道公寓</h3>
                <p class="apartment-address">808 S Michigan Ave.<br>芝加哥, IL 60605</p>
                <p class="apartment-specs">单间 - 4室 | $2,203 - $11,500</p>
            </div>
        </div>
    </div>

    <div class="view-more">
        <button class="view-more-btn">查看更多</button>
    </div>
</div>

<!-- 页脚 -->
<footer>
    <div class="footer-container">
        <div class="footer-column">
            <h3>关于我们</h3>
            <ul>
                <li><a href="#">公司简介</a></li>
                <li><a href="#">团队介绍</a></li>
                <li><a href="#">加入我们</a></li>
                <li><a href="#">新闻中心</a></li>
            </ul>
        </div>

        <div class="footer-column">
            <h3>帮助中心</h3>
            <ul>
                <li><a href="#">常见问题</a></li>
                <li><a href="#">租房指南</a></li>
                <li><a href="#">房东指南</a></li>
                <li><a href="#">联系我们</a></li>
            </ul>
        </div>

        <div class="footer-column">
            <h3>服务条款</h3>
            <ul>
                <li><a href="#">用户协议</a></li>
                <li><a href="#">隐私政策</a></li>
                <li><a href="#">免责声明</a></li>
                <li><a href="#">投诉建议</a></li>
            </ul>
        </div>

        <div class="footer-column">
            <h3>关注我们</h3>
            <p>订阅我们的新闻通讯，获取最新房源信息</p>
            <div class="social-links">
                <a href="#"><i class="fab fa-weixin"></i></a>
                <a href="#"><i class="fab fa-weibo"></i></a>
                <a href="#"><i class="fab fa-qq"></i></a>
                <a href="#"><i class="fab fa-tiktok"></i></a>
            </div>
        </div>
    </div>

    <div class="copyright">
        <p>&copy; 2023 公寓租房网 版权所有 | 京ICP备12345678号</p>
    </div>
</footer>

<script>
    // 搜索功能处理
    document.querySelector('form').addEventListener('submit', function(e) {
        e.preventDefault();
        const query = document.querySelector('input[name="query"]').value;
        if(query.trim() !== '') {
            // 这里可以添加AJAX请求或直接提交表单
            alert('正在搜索: ' + query);
            // 实际应用中应该跳转到搜索结果页或使用AJAX加载结果
            // window.location.href = 'search.jsp?query=' + encodeURIComponent(query);
        }
    });
</script>
</body>
</html>