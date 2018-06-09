<%@ page import="blog.yisheng.bookstore.dao.impl.OrderDAOImpl" %>
<%@ page import="blog.yisheng.bookstore.entity.Order" %>
<%@ page import="blog.yisheng.bookstore.entity.User" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: ysyang
  Date: 13/12/2016
  Time: 3:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<%@include file="header.html" %>
<body>
<div class="container">
    <%@include file="navbar.html" %>
    <div style="margin-left: 5%; margin-top: 5%">
        <%
            if (session.getAttribute("user") == null) {
                out.print("<h1>您尚未登录</h1>");
            } else {
                User user = (User) session.getAttribute("user");
                OrderDAOImpl orderDAO = new OrderDAOImpl();
                ArrayList<Order> orders = orderDAO.listOrders(user.getUsername());
                if (orders.size() == 0) {
                    out.print("<h1>您没有订单记录</h1>");
                } else {
                    for (Order order : orders) {
                        out.print("<a href=orderdetail.jsp?orderid=" + order.getOrderID() + "><h4>订单号:" + order.getOrderID() + "</h4></a>");
                        out.print("<p class=\"lead\">收件人：" + order.getUsername() + "</p>");
                        out.print("<p class=\"lead\">创建日期：" + order.getDate() + "</p>");
                    }
                }
            }
        %>
    </div>


    <%@include file="footer.html" %>
</div>


</body>
</html>
