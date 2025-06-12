<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.User" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ page import="listener.OnlineUserListener" %> --%>
<jsp:useBean id="userService" class="service.UserServiceImp" />
<%
    // 会话检查
    User currentUser = (User) session.getAttribute("currentUser");
    if (currentUser == null) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
        return;
    }
    // 获取所有用户列表，用于用户管理
    List<User> users = userService.getAllUsers();
    request.setAttribute("users", users);

    // === 修改代码：获取已登录用户数 ===
    Integer loggedInUserCount = (Integer) application.getAttribute("loggedInUserCount"); // 使用监听器中定义的常量键名
    if (loggedInUserCount == null) {
        loggedInUserCount = 0;
    }
    // === 修改代码结束 ===
%>

<!DOCTYPE html>

<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户首页 - 管理系统</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
    <style>
        /* 您已有的样式 */
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: 'Segoe UI', sans-serif; background: #f4f7fa; color: #333; }
        a { color: inherit; text-decoration: none; }

        /* 布局容器 */
        .wrapper { display: flex; min-height: 100vh; }
        /* 侧边栏 */
        .sidebar {
            width: 240px;
            background: #2f3e4e;
            color: #fff;
            display: flex;
            flex-direction: column;
        }
        .sidebar .brand {
            font-size: 1.25rem;
            text-align: center;
            padding: 1rem;
            background: #233041;
        }
        .sidebar nav { flex: 1; }
        .sidebar ul { list-style: none; }
        .sidebar li { }
        .sidebar a.nav-link {
            display: block;
            padding: 0.75rem 1rem;
            transition: background 0.3s;
        }
        .sidebar a.nav-link:hover,
        .sidebar .nav-item.active a.nav-link {
            background: #1e2a36;
        }

        /* 主要内容 */
        .main { flex: 1; }
        .navbar {
            background: #fff;
            padding: 0.5rem 1rem;
            display: flex;
            justify-content: space-between;
            box-shadow: 0 1px 4px rgba(0,0,0,0.1);
        }
        .navbar .welcome {
            display: flex;
            align-items: center;
        }
        .navbar .avatar {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background: #6B73FF;
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 0.5rem;
            font-weight: bold;
            text-transform: uppercase;
        }
        .navbar h2 {
            font-size: 1rem;
            margin-right: 1rem;
        }
        .logout-btn { color: #6B73FF; }

        .content { padding: 1.5rem; }
        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(420px, 1fr));
            gap: 1rem;
        }
        .card {
            background: #fff;
            border-radius: 0.75rem;
            padding: 1rem;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }
        .card h3 {
            margin-bottom: 0.75rem;
            font-size: 1.1rem;
            color: #4a4a4a;
        }
        .info-list { list-style: none; }
        .info-list li {
            padding: 0.5rem 0;
            border-bottom: 1px solid #eef1f5;
            display: flex;
            justify-content: space-between;
        }
        .info-list li:last-child { border-bottom: none; }

        /* 用户管理表格 */
        .user-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1rem;
        }
        .user-table th, .user-table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        .user-table th { background: #f2f2f2; }

        /* 响应式 */
        @media (max-width: 768px) {
            .sidebar { width: 60px; }
            .sidebar .brand, .sidebar a.nav-link span { display: none; }
            .sidebar a.nav-link { text-align: center; }
        }
    </style>
</head>
<body>
<div class="wrapper">
    <div class="sidebar">
        <div class="brand">管理系统</div>
        <nav>
            <ul>
                <li class="nav-item active">
                    <a class="nav-link" href="#" onclick="show('dashboard')">
                        <i class="fas fa-home"></i>
                        <span>面板</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" onclick="show('profile')">
                        <i class="fas fa-user"></i>
                        <span>个人中心</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" onclick="show('stats')">
                        <i class="fas fa-chart-line"></i>
                        <span>系统状态</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" onclick="show('usermanage')">
                        <i class="fas fa-users"></i>
                        <span>用户管理</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>

    <div class="main">
        <div class="navbar">
            <div class="welcome">
                <div class="avatar"><%= currentUser.getUsername().substring(0,1) %></div>
                <h2>欢迎，<%= currentUser.getUsername() %></h2>
            </div>
            <a class="logout-btn" href="${pageContext.request.contextPath}/logout">
                退出&nbsp;<i class="fas fa-sign-out-alt"></i>
            </a>
        </div>

        <div class="content">
            <div id="dashboard" class="cards">
                <div class="card">
                    <h3>登录信息</h3>
                    <ul class="info-list">
                        <li>
                            <span>用户名</span>
                            <span><%= currentUser.getUsername() %></span>
                        </li>
                        <li>
                            <span>邮箱</span>
                            <span><%= currentUser.getEmail() %></span>
                        </li>
                        <li>
                            <span>最后登录时间</span>
                            <span><%= currentUser.getLastLoginTime() %></span>
                        </li>
                    </ul>
                </div>
                <div class="card">
                    <h3>系统状态</h3>
                    <ul class="info-list">
                        <li>
                            <span>系统版本</span>
                            <span>v1.0.0</span>
                        </li>
                        <li>
                            <span>在线用户</span>
                            <%-- === 修改代码：显示已登录用户数 === --%>
                            <span><strong><%= loggedInUserCount %></strong> 人</span>
                            <%-- === 修改代码结束 === --%>
                        </li>
                    </ul>
                </div>
            </div>

            <div id="profile" class="cards" style="display:none;">
                <div class="card">
                    <h3>个人信息</h3>
                    <ul class="info-list">
                        <li>
                            <span>用户名</span>
                            <span><%= currentUser.getUsername() %></span>
                        </li>
                        <li>
                            <span>邮箱</span>
                            <span><%= currentUser.getEmail() %></span>
                        </li>
                        <li>
                            <span>性别</span>
                            <span><%= currentUser.getGender() == null ? "未设置" : currentUser.getGender() %></span>
                        </li>
                    </ul>
                </div>
            </div>

            <div id="stats" class="cards" style="display:none;">
                <div class="card">
                    <h3>更多功能</h3>
                    <p>待开发中，敬请期待...</p>
                </div>
            </div>

            <div id="usermanage" class="cards" style="display:none; flex-direction: column;">
                <div class="card" style="overflow-x:auto;">
                    <h3>用户列表</h3>
                    <table class="user-table">
                        <tr>
                            <th>用户名</th>
                            <th>密码 (加密后)</th>
                            <th>邮箱</th>
                            <th>操作</th>
                        </tr>
                        <c:forEach var="u" items="${users}">
                            <tr>
                                <td>${u.username}</td>
                                <td>${u.password}</td>
                                <td>${u.email}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/UserServlet?action=edit&username=${u.username}">编辑</a> |
                                    <a href="${pageContext.request.contextPath}/UserServlet?action=delete&username=${u.username}" onclick="return confirm('确认删除用户 ${u.username}？');">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
                <div class="card">
                    <h3>新增用户</h3>
                    <form action="${pageContext.request.contextPath}/UserServlet" method="post">
                        <input type="hidden" name="action" value="add" />
                        用户名：<input type="text" name="username" required /><br/>
                        密码：<input type="password" name="password" required /><br/>
                        邮箱：<input type="email" name="email" required /><br/>
                        <button type="submit">添加</button>
                    </form>
                </div>

                <c:if test="${not empty editUser}">
                    <div class="card">
                        <h3>编辑用户：${editUser.username}</h3>
                        <form action="${pageContext.request.contextPath}/UserServlet" method="post">
                            <input type="hidden" name="action" value="update" />
                            <input type="hidden" name="oldUsername" value="${editUser.username}" />
                            用户名：<input type="text" name="username" value="${editUser.username}" required /><br/>
                            密码：<input type="password" name="password" placeholder="留空则不修改" /><br/>
                            邮箱：<input type="email" name="email" value="${editUser.email}" required /><br/>
                            <button type="submit">更新</button>
                        </form>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</div>

<script>
    function show(section) {
        document.querySelectorAll('.content > div').forEach(c => c.style.display = 'none');
        const targetSection = document.getElementById(section);
        if (targetSection) {
            targetSection.style.display = (section === 'usermanage' || section === 'profile') ? 'flex' : 'grid';
            if (section === 'usermanage' || section === 'profile') {
                targetSection.style.flexDirection = 'column';
            }
        }

        document.querySelectorAll('.sidebar .nav-item').forEach(li => li.classList.remove('active'));
        let currentLink = event.currentTarget; // event.currentTarget is better here
        if (currentLink) { // Make sure currentLink is not null
            currentLink.closest('.nav-item').classList.add('active');
        }
    }

    document.addEventListener('DOMContentLoaded', function() {
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.get('action') === 'edit' && urlParams.get('username')) {
            show('usermanage');
            const editFormCard = document.querySelector('#usermanage .card form[action*="update"]');
            if(editFormCard) {
                editFormCard.parentElement.scrollIntoView({ behavior: 'smooth' });
            }
        } else {
            show('dashboard'); // Default to dashboard
        }
    });
</script>

</body>
</html>