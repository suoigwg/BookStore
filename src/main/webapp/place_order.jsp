<%@ page import="blog.yisheng.bookstore.entity.Book" %>
<%@ page import="blog.yisheng.bookstore.entity.Cart" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: ysyang
  Date: 12/12/2016
  Time: 8:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/custom.css">
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <title>我的订单</title>
</head>
<h1></h1>
<body>

    <%
        if (request.getSession().getAttribute("cart") == null) {
            out.print("<h1>请先登录</h1>");
        } else {
            Cart cart = (Cart) request.getSession().getAttribute("cart");
            if (cart.isEmpty()) {
                out.println("<h1>您的购物车是空的</h1>");
            } else {
                HashMap<Book, Integer> itemList = cart.getCartItems();
                for (Map.Entry<Book, Integer> item : itemList.entrySet()) {
                    out.print(item.getKey().getTitle() + ":");
                    out.print(item.getValue());
                }
                out.print("<h1>总金额为:</h1>" + cart.getTotalPrice());
            }
        }

    %>

<h1>请确认您的收货地址</h1>

<form class="form-inline" action="order" method="post">
    <div class="form-group">
        <label for="exampleInputEmail1">收件人</label>
        <input class="form-control" id="exampleInputEmail1" placeholder="" name="receiver">
    </div>
    <div class="form-group">
        <label for="exampleInputPassword1">地址</label>
        <input class="form-control" id="exampleInputPassword1" placeholder="地址" name="address">
    </div>
    <div class="form-group">
        <label for="exampleInputFile">联系电话</label>
        <input id="exampleInputFile" name="mobile">
    </div>
    <div class="checkbox">
        <label>
            <input type="checkbox"> 保存收货信息
        </label>
    </div>
    <button type="submit" class="btn btn-default">提交</button>
</form>


</body>
</html>
