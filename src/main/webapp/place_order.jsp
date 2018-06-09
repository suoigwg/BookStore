<%--
  Created by IntelliJ IDEA.
  User: ysyang
  Date: 12/12/2016
  Time: 8:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <%@include file="header.html" %>
</head>
<h1></h1>
<body>
<div class="container">
    <%@include file="navbar.html" %>
    <hr>
    <h1 class="text-center">请确认您的收货地址</h1>
    <div style="margin-left: 30%; margin-right: 30%">
        <form action="order" method="post">
            <div class="form-group">
                <label for="receiver">收件人</label>
                <input name="receiver" type="text" class="form-control" id="receiver" aria-describedby="emailHelp"
                       placeholder="收件人">
                <small id="emailHelp" class="form-text text-muted">您的信息不会泄露给任何人</small>
            </div>
            <div class="form-group">
                <label for="address">地址</label>
                <input name="address" type="text" class="form-control" id="address" placeholder="地址">
            </div>
            <div class="form-group">
                <label for="mobile">联系电话</label>
                <input name="mobile" type="number" class="form-control" id="mobile" placeholder="联系电话">
            </div>
            <button type="submit" class="btn btn-primary btn-block">Submit</button>
        </form>
    </div>

</div>


</body>
</html>
