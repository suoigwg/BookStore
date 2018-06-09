<%--
  Created by IntelliJ IDEA.
  User: ysyang
  Date: 10/12/2016
  Time: 2:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<%@include file="header.html" %>
<body>
<div class="container">
    <%@include file="navbar.html" %>
    <h1 class="text-center">登录</h1>
    <div style="padding-left: 30%; padding-right: 30%">
        <form method="post" action="login">
            <form>
                <div class="form-group">
                    <label for="exampleInputEmail1">用户名</label>
                    <input value="Yisheng Yang" name="username" type="text" class="form-control" id="exampleInputEmail1"
                           placeholder="Username">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">密码</label>
                    <input value="admin" name="password" type="password" class="form-control" id="exampleInputPassword1"
                           placeholder="Password">
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
</div>


</body>
</html>
