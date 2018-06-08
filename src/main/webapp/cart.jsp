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
<head>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/custom.css">
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <title>购物车</title>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
<div class="container">
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
            }
        }
    %>
    <a href="place_order.jsp"><h2>提交订单</h2></a>

</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
