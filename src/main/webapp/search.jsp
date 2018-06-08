<%--
  Created by IntelliJ IDEA.
  User: ysyang
  Date: 11/12/2016
  Time: 8:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="blog.yisheng.bookstore.entity.Book" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Search Result</title>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>

<div class="container">
    <div class="row">
        <%
            Object r = request.getAttribute("result");
            if (r == null)
                out.println("<h1>搜索关键字为空</h1>");
            ArrayList<Book> result = (ArrayList<Book>) r;
            for (Book book : result) {
                out.print("<a href=detail.jsp?id=" + book.getID() + "><h1>" + book.getTitle() + "</h1></a>");
            }
        %>
    </div>
</div>

</body>

</html>
