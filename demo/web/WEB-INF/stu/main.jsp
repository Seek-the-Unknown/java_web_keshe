<%--
  Created by IntelliJ IDEA.
  User: Lzs
  Date: 2025/4/3
  Time: 19:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <h1>三江学学生管理系统————主界面</h1>
  <hr><br>
  <div>
    学号：${student.stuId},姓名：${student.stuName},登录密码：${student.loginPwd}
    [<a href ="${pageContext.request.contextPath}/stu/loginOut">退出</a>]
  </div>
</body>
</html>
