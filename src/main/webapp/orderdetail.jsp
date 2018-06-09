<%@ page import="blog.yisheng.bookstore.dao.impl.BookDAOImpl" %>
<%@ page import="blog.yisheng.bookstore.dao.impl.OrderRecordDAOImpl" %>
<%@ page import="blog.yisheng.bookstore.entity.Book" %>
<%@ page import="blog.yisheng.bookstore.entity.OrderRecord" %>
<%@ page import="blog.yisheng.bookstore.entity.User" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: ysyang
  Date: 12/12/2016
  Time: 9:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="header.html" %>
<body>

<h3></h3>
<div class="container">
    <%@include file="navbar.html" %>
    <div>
        <%
            if (session.getAttribute("user") == null) {
                out.print("<h1>您尚未登录</h1>");
            } else {
                User user = (User) session.getAttribute("user");
                String orderID = request.getParameter("orderid");
                OrderRecordDAOImpl recordDAO = new OrderRecordDAOImpl();
                out.print("<h4>订单号:" + orderID + "</h4>");
                out.print("<h5>订单详情</h5>");
                out.print("<hr>");
                ArrayList<OrderRecord> orderRecords = recordDAO.getOrderDetail(Integer.parseInt(orderID));
                BookDAOImpl bookDAO = new BookDAOImpl();
                for (OrderRecord record : orderRecords) {
                    Book book = (Book) bookDAO.retrieve(record.getId() + "");
                    out.print("<p class=\"lead\">商品名称：" + book.getTitle() + "</p>");
                    out.print("<p class=\"lead\">价格：" + book.getPrice() + "</p>");
                    out.print("<p class=\"lead\">数量：" + record.getAmount() + "</p>");
                }
            }
        %>
    </div>
    <p class="lead">商品编号：</p>
    <%@include file="footer.html" %>
</div>
</body>
</html>
