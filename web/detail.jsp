<%@ page import="ch.ysyang.ecommerce.Book" %>
<%@ page import="ch.ysyang.ecommerce.BookDAO" %>
<%@ page import="ch.ysyang.ecommerce.JDBConnection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %><%--
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
<%
    String id = request.getParameter("id");
    String recentViewed = "";
    if (id != null && !id.equals("")) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals("RecentViewed")) {
                    recentViewed = c.getValue();
                }
            }
        }
        recentViewed += id + "#";
        String[] viewed = recentViewed.split("#");
        if (viewed != null && viewed.length > 10) {
            recentViewed = recentViewed.substring(recentViewed.length() - 12);
        }
        Cookie cookie = new Cookie("RecentViewed", recentViewed);
        response.addCookie(cookie);

        JDBConnection con = new JDBConnection();
        String sql = "select * from Book where ID = " + id;
        ResultSet resultSet = con.executeQuery(sql);
        if (resultSet.next()) {
%>
<div class="container">
    <div class="row">
        <hr>
        <div class="col-lg-6 col-md-6 col-sm-6">
            <h1><%=resultSet.getString("BookName")%>
            </h1>
            <form action="/cartservlet" method="get">
                <input hidden="hidden" value="<%=resultSet.getString("ID")%>" name="bookid">
                <input hidden="hidden" name="action" value="add">
                <br><br><br>
                <p>Price: <%=resultSet.getString("Price")%>
                </p>
                <p>Amount: <%=resultSet.getString("Amount")%>
                </p>
                <p>Press: <%=resultSet.getString("Press")%>
                </p>
                <p>Author: <%=resultSet.getString("Author")%>
                </p>
                <p>Buy: <input type="number" id="buyamount" value="1" name="buyamount"></p>
                <button type="submit" class="btn btn-success">Add to cart</button>
            </form>

        </div>

        <div class="col-lg-6 col-md-6 col-sm-6">
            <img src="img/book.png" width="400" height="400">
        </div>
        <%

                }
            }
            BookDAO bd = new BookDAO();
            ArrayList<Book> rv = bd.getRecentViewList(recentViewed);
        %>
        <h3>Recently Viewed</h3>
        <%
            if (rv != null) {
                for (Book b : rv) {
                    if (b != null) {
        %>
        <ul>
            <li><a href="detail.jsp?id=<%=b.getID()%>"><%=b.getBookName()%>
            </a></li>
        </ul>
        <% }
        }
        }

        %>
        <%

        %>

    </div>
</div>

</body>
</html>
