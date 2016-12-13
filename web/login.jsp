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
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

    <title>Title</title>
</head>
<body>
<form method="post" action="/login">
    <ul>
        <li>Email: <input type="text" size="30" name="email" value="admin@1.com"></li>
        <li>Password: <input type="password" name="password" value="admin"></li>
        <li>Remember me: <input type="checkbox" name="remember" checked="n"></li>
        <li><input type="submit" value="Submit"></li>
    </ul>
</form>

</body>
</html>
