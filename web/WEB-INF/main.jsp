<%--
  Created by IntelliJ IDEA.
  User: xlj
  Date: 2025/3/15
  Time: 15:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.User" %>
<%@ page import ="dao.UserDaoImp" %>
<%@ page import="dao.UserDao" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户首页-用户信息管理系统</title>
    <%--外链式引用CSS样式--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainStyle.css"/>
    <%--Font Awesome是一个图标字体库，用于网页设计和开发。--%>
    <%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/all.min.css">--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
<!-- 左侧导航栏区 -->
<nav class="sidebar">
    <div class="nav-brand">用户信息管理系统</div>
    <ul class="nav-menu">
        <li class="nav-item active">
            <a href="#" onclick="showSection('system')">
                <i class="fas fa-user-circle"></i>
                系统状态
            </a>
        </li>
        <li class="nav-item">
            <a href="#" onclick="showSection('profile')">
                <i class="fas fa-user-circle"></i>
                个人中心
            </a>
        </li>
        <li class="nav-item">
            <a href="#" onclick="showSection('infos')">
                <i class="fas fa-users-cog"></i>
                信息管理
            </a>
        </li>
    </ul>
</nav>

<%--下方为jsp动态页面独有的使用方法，即可以在静态元素中插入Java服务器端代码--%>
<%
    // 获得请求域对象中保存的域属性，属性名为user
    // 需与LoginServlet中的代码request.setAttribute("user",u);配合一起使用
    // 因为只有request域中存了名为user的域属性，此处才能获取得到信息，为下方页面显示提供数据支撑
    User user = (User) request.getAttribute("currentUser");
%>

<!-- 主内容区 -->
<div class="main-content">
    <!-- 导航栏 -->
    <nav class="navbar">
        <div class="brand">欢迎学习Javaweb课程！</div>
        <div class="welcome-section">
            <div class="user-avatar">${currentUser.username.charAt(0)}</div>
            <div>
                <h3>欢迎回来，${currentUser.username}！</h3>
                <small>下午好！</small>
            </div>
            <a href="/Lzs_exp4/index.jsp" class="logout-btn">退出登录</a>
        </div>
    </nav>

    <%-- 系统状态区，显示系统版本与用户登录基本信息--%>
    <%-- 默认登录后，看到系统状态区--%>
    <div class="container content-section active" id="systemSection">
        <div class="dashboard-cards">
            <div class="card user-info-card">
                <h2><i class="fas fa-user-circle"></i> 登录信息</h2>
                <div class="info-item">
                    <span>用户名：</span>
                    <span>${currentUser.username}</span>
                </div>
                <div class="info-item">
                    <span>用户角色：</span>
                    <span>${currentUser.username}</span>
                </div>
                <div class="info-item">
                    <span>用户最后登录时间：</span>
<%--                    <span>${user.lastLogin}</span>--%>
                </div>
            </div>
            <!-- 可以继续添加其他功能卡片 -->
            <div class="card">
                <h2><i class="fas fa-tachometer-alt"></i> 系统状态</h2>
                <br>
                <p>系统版本：v1.0.0</p>
            </div>
        </div>
    </div>

    <!-- 个人中心内容区 -->
    <div class="container content-section" id="profileSection">
        <!-- 用户信息卡片 -->
        <div class="dashboard-cards">
            <div class="card user-info-card">
                <h2><i class="fas fa-user-circle"></i> 个人信息（请补充功能以显示用户信息）</h2>
                <div class="info-item">
                    <span>用户名：</span>
                    <span>${currentUser.username}</span>
                </div>
                <div class="info-item">
                    <span>用户密码：</span>
                    <span>${currentUser.password}</span>
                </div>
                <div class="info-item">
                    <span>用户姓名：</span>
                    <span>${currentUser.username}</span>
                </div>
                <div class="info-item">
                    <span>用户性别：</span>
                    <span>${currentUser.gender}</span>
                </div>
                <div class="info-item">
                    <span>出生日期：</span>
                    <span></span>
                </div>
                <div class="info-item">
                    <span>用户邮箱：</span>
                    <span>${currentUser.email}</span>
                </div>
                <div class="info-item">
                    <span>用户注册时间：</span>
                    <span></span>
                </div>
            </div>
        </div>
    </div>

    <!-- 用户信息管理内容 -->
    <div class="container content-section" id="infosSection">
        <div class="card">
            <table class="user-table">
                <thead>
                <tr>
                    <th>功能还未实现，敬请期待....</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
    // 通过左侧导航栏的点击交互，控制显示对应内容区块
    function showSection(sectionId) {
        //隐藏所有内容区块
        document.querySelectorAll('.content-section').forEach(section => {
            section.classList.remove('active');
        });
        //显示目标内容区块
        document.getElementById(sectionId + 'Section').classList.add('active');

        //移除所有导航项的激活状态
        document.querySelectorAll('.nav-item').forEach(item => {
            item.classList.remove('active');
        });
        //从当前元素开始向上查找最近的匹配选择器的祖先元素
        //然后更新导航激活状态，event.target指向当前点击的元素
        event.target.closest('.nav-item').classList.add('active');
    }
</script>
</body>
</html>