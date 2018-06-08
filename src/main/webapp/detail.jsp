<%@ page import="blog.yisheng.bookstore.dao.impl.BookDAOImpl" %>
<%@ page import="blog.yisheng.bookstore.entity.Book" %>
<%--
  Created by IntelliJ IDEA.
  User: ysyang
  Date: 12/12/2016
  Time: 8:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/custom.css">
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <title></title>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
<div class="container">
    <div class="row">
        <%
            BookDAOImpl bookDAO = new BookDAOImpl();
            Book book = (Book) bookDAO.retrieve(request.getParameter("id"));
        %>
        <h1><%=book.getTitle()%>
        </h1>
        <a href="cart?action=add&amount=1&username=yisheng&id=<%=book.getID()%>">添加到购物车</a>
    </div>
</div>

</body>
</html>
