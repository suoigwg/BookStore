<%@ page import="blog.yisheng.bookstore.entity.Book" %>
<%@ page import="blog.yisheng.bookstore.entity.Cart" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%--
  Created by IntelliJ IDEA.
  User: ysyang
  Date: 12/12/2016
  Time: 6:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="header.html" %>
<body>
<div class="container">
    <%@include file="navbar.html" %>
    <div style="margin-left: 5%; margin-top: 5%">

        <%
            if (session.getAttribute("user") == null) {
                out.println("<h1>您尚未登录</h1>");
            } else {
                Object c = session.getAttribute("cart");
                Cart cart = null;
                cart = c == null ? new Cart() : (Cart) c;
                if (cart.isEmpty()) {
                    out.println("<h1>您的购物车是空的</h1>");
                } else {
                    HashMap<Book, Integer> itemList = cart.getCartItems();
                    for (Map.Entry<Book, Integer> item : itemList.entrySet()) {
                        out.print("<p class=\"lead\">商品名称:" + item.getKey().getTitle() + "</p>");
                        out.print("<p>单价：" + item.getKey().getPrice() + "</p>");
                        out.print("<p>数量：" + item.getValue() + "</p>");
                    }
                    out.print("<h5>总金额为:" + cart.getTotalPrice() + "</h5>");
                    out.print("<a href=\"place_order.jsp\"><button class=\"btn btn-primary\">提交订单</button></a>");
                }
            }
        %>
    </div>
    <%@include file="footer.html" %>
</div>

</body>
</html>
