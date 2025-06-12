<%@ page import="service.UserService" %>
<%@ page import="service.UserServiceImp" %><%--
  Created by IntelliJ IDEA.
  User: Lzs
  Date: 2025/4/17
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    
</head>
<body>
    <%
        request.setCharacterEncoding("utf-8");
    %>
<%--    用jsp动作指令来完成注册功能，先创建一个javabean对象，来装表单提交过来的信息--%>
    <jsp:useBean id="newUer" class ="model.User" scope ="session" ></jsp:useBean>
    <jsp:setProperty name="newUer" property="*"></jsp:setProperty>
    <h3></h3>
    <jsp:getProperty name="newUer" property="uname "></jsp:getProperty>>
    <jsp:getProperty name="newUer" property="password"></jsp:getProperty>
    <jsp:getProperty name="newUer;" property="role"></jsp:getProperty>
    <jsp:getProperty name="newUer" property="rname"></jsp:getProperty>
    <%
        response.setContentType("text/html; charset = utf-8");
        UserService userService = new UserServiceImp();
//        userService.addOneUser(newUser);
//        session.setAttribute();
    %>


</body>
</html>
