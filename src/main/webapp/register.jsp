<%--
  Created by IntelliJ IDEA.
  User: ysyang
  Date: 10/12/2016
  Time: 2:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/custom.css">
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>

<h1 class="text-center">欢迎</h1>
<div id="loginForm">
    <form method="post" action="register">
        <form>
            <div class="form-group">
                <label>您的姓名</label>
                <input value="Yisheng Yang" name="username" type="text" class="form-control" id="exampleInputEmail1"
                       placeholder="">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail1">邮件地址</label>
                <input value="admin@1.com" name="email" type="email" class="form-control" id="exampleInputEmail1"
                       placeholder="">
            </div>
            <div class="form-group">
                <label>密码</label>
                <input value="admin" name="password" type="password" class="form-control" id="password">
                <label>确认密码</label>
                <input value="admin" name="passwordAgain" type="password" class="form-control" id="passwordagain">
            </div>

            <button type="submit" class="btn btn-primary btn-block">创建账号</button>
            <br>

            <hr>
            <p>已经有账号? <a href="login.jsp">登录</a></p>
        </form>
    </form>
</div>


</body>
</html>
