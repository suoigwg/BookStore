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
                    out.print(item.getKey().getTitle() + ":");
                    out.print(item.getValue());
                }
                out.print("<h1>总金额为:</h1>" + cart.getTotalPrice());
                out.print("<a href=\"place_order.jsp\"><h2>提交订单</h2></a>");
            }
        }
    %>

    <%@include file="footer.html" %>
</div>

</body>
</html>
