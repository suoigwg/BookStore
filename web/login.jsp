<%--
  Created by IntelliJ IDEA.
  User: ysyang
  Date: 10/12/2016
  Time: 2:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/custom.css">
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <title>Title</title>
</head>
<body>

<h1 class="text-center">欢迎</h1>
<div id="loginForm">
    <form method="post" action="/login">
        <form>
            <div class="form-group">
                <label for="exampleInputEmail1">邮件地址</label>
                <input value="admin@1.com" name="email" type="email" class="form-control" id="exampleInputEmail1"
                       placeholder="Email">
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">密码</label>
                <input value="admin" name="password" type="password" class="form-control" id="exampleInputPassword1"
                       placeholder="Password">
            </div>

            <div class="checkbox">
                <label>
                    <input name="remember" type="checkbox">记住我
                </label>
            </div>
            <button type="submit" class="btn btn-primary btn-block">登录</button>
            <br>
            <p class="text-center">或</p><br>
            <a href="register.jsp">
                <button type="button" class="btn btn-default btn-block">创建一个新账户</button>
            </a>

        </form>
    </form>
</div>


</body>
</html>
