<%--
  Created by IntelliJ IDEA.
  User: ysyang
  Date: 14/12/2016
  Time: 12:15 AM
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
<h1 class="text-center">Welcome to Nozama!</h1>
<div id="errorBox">
    <span class="glyphicon glyphicon-alert"></span>
    <p class="text-danger text-center lead">The Email address has been taken</p>
    <a href="register.jsp">
        <button type="button" class="btn btn-primary btn-block">Use another Email</button>
    </a>
    <br>
    <a href="index.jsp">
        <button type="button" class="btn btn-default btn-block">Back to HomePage</button>
    </a>

</div>
</body>
</html>
