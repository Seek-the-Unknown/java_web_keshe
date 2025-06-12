<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>三江学院学生管理系统</title>
    <style>

    </style>
</head>
<body>
    <h1>三江学院学生管理系统</h1>
    <hr><br>
    <h2><font color="red">${sessionScope.loginError}</font></h2>
    <form action="${pageContext.request.contextPath}/Lzs_login" method="POST">
        <table border="1">
            <tr>
                <td>学号：</td>
                <td>
                    <input type="text" name="username"
                           value="<%= session.getAttribute("rememberedUser") != null ? session.getAttribute("rememberedUser") : "" %>">
                    <font color="red">${errorFields.username}</font>
                </td>
            </tr>
            <tr>
                <td>登录密码：</td>
                <td>
                    <input type="password" name="password"
                           value="<%= session.getAttribute("rememberedPwd") != null ? session.getAttribute("rememberedPwd") : "" %>">
                    <font color="red">${errorFields.password}</font>
                </td>
            </tr>
            <!-- 添加记住我选项 -->
            <tr>
                <td>记住我：</td>
                <td><input type="checkbox" name="rememberMe" value="on"></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" value="学生登录"></td>
            </tr>
        </table>
    </form>
    <%
        if (session.getAttribute("loginError") != null) {
            session.removeAttribute("loginError");
        }
    %>
    <h2><font color="green">${applicationScope.info}</font></h2>
    <%
        if (application.getAttribute("info") != null) {
            application.removeAttribute("info");
        }
    %>
</body>
</html>