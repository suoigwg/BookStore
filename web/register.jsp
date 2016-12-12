<%--
  Created by IntelliJ IDEA.
  User: ysyang
  Date: 10/12/2016
  Time: 2:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
</head>
<body>

<form method="post" action="/register">
    <ul>
        <li>Email: <input type="text" size="30" name="email" value="admin@1.com"></li>
        <li>Username: <input type="text" name="username"></li>
        <li>Password: <input type="password" name="password" value="admin"></li>
        <li><input type="submit" value="Submit"></li>
        <li><input type="reset" value="Reset"></li>
    </ul>
</form>

</body>
</html>
