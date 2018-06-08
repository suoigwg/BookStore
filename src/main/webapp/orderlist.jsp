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
<head>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/custom.css">
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <title>Order History</title>
</head>

<body>
<jsp:include page="navbar.jsp"></jsp:include>
<div class="container">
    <div class="row">
        <%
            if (session.getAttribute("user") == null) {
                out.print("<h1>您尚未登录</h1>");
            } else {
                User user = (User) session.getAttribute("user");
                OrderDAOImpl orderDAO = new OrderDAOImpl();
                System.out.print("======" + user.getUsername());
                ArrayList<Order> orders = orderDAO.listOrders(user.getUsername());
                if (orders.size() == 0) {
                    out.print("<h1>您没有订单记录</h1>");
                } else {
                    for (Order order : orders) {
                        out.print("<h4>" + order.getOrderID() + "</h4>");
                        out.print("<h4>" + order.getUsername() + "</h4>");
                    }
                }
            }

        %>
    </div>
</div>


</body>
</html>
