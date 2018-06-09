<%@ page import="blog.yisheng.bookstore.dao.impl.BookDAOImpl" %>
<%@ page import="blog.yisheng.bookstore.entity.Book" %>
<%@ page import="blog.yisheng.bookstore.entity.User" %>
<%--
  Created by IntelliJ IDEA.
  User: ysyang
  Date: 12/12/2016
  Time: 8:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="header.html" %>
<body>

<div class="container">
    <%@include file="navbar.html" %>
    <hr>
    <div class="row">
        <div class="col-md-6 col-sm-12" style="font-size: 200% ">
            <%
                BookDAOImpl bookDAO = new BookDAOImpl();
                Book book = (Book) bookDAO.retrieve(request.getParameter("id"));
            %>
            <h1><%=book.getTitle()%>
            </h1>
            <ul>
                <li>作者：<%=book.getAuthor()%>
                </li>
                <li>出版社：<%=book.getPress()%>
                </li>
                <li>单价：<%=book.getPrice()%>
                </li>
            </ul>
            <%
                if (session.getAttribute("user") == null)
                    out.print("<h5>您尚未登录</h5>");
                else {
                    User user = (User) session.getAttribute("user");
                    out.print("<a href=\"cart?action=add&amount=1&username=" + user.getUsername() + "&id=" + book.getID() + "\">添加到购物车</a>");
                }
            %>


        </div>
        <div class="col-md-6 col-sm-12">
            <div class="card">
                <img src="img/book.png" class="card-img-top">
                <div class="card-body">
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                        card's content.</p>
                </div>
            </div>
        </div>
    </div>
    <%@include file="footer.html" %>
</div>

</body>
</html>
