<%@ page import="blog.yisheng.bookstore.dao.impl.OrderDAOImpl" %>
<%@ page import="blog.yisheng.bookstore.dao.impl.OrderRecordDAOImpl" %>
<%@ page import="blog.yisheng.bookstore.entity.Order" %>
<%@ page import="blog.yisheng.bookstore.entity.OrderRecord" %>
<%@ page import="blog.yisheng.bookstore.entity.User" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: ysyang
  Date: 12/12/2016
  Time: 9:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/custom.css">
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <title>订单详情</title>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
<h3></h3>
<div class="container">
    <%
        if (session.getAttribute("user") == null) {
            out.print("<h1>您尚未登录</h1>");
        } else {
            User user = (User) session.getAttribute("user");
            OrderDAOImpl orderDAO = new OrderDAOImpl();
            ArrayList<Order> orders = orderDAO.listOrders(user.getUsername());
            OrderRecordDAOImpl orderRecordDAO = new OrderRecordDAOImpl();
            for (Order order : orders) {
                ArrayList<OrderRecord> orderRecords = orderRecordDAO.getOrderDetail(order.getOrderID());
                for (OrderRecord record : orderRecords) {
                    out.print("<h3>" + record.getOrderID() + "</h3>");
                    out.print("<h3>" + record.getAmount() + "</h3>");
                    out.print("<h3>" + record.getId() + "</h3>");
                }

            }
        }
    %>
</div>
</body>
</html>
