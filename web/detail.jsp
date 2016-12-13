<%@ page import="ch.ysyang.ecommerce.JDBConnection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="ch.ysyang.ecommerce.BookDAO" %>
<%@ page import="ch.ysyang.ecommerce.Book" %><%--
  Created by IntelliJ IDEA.
  User: ysyang
  Date: 12/12/2016
  Time: 8:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="js/CartHandler.js"></script>
    <title></title>
</head>
<body>
    <%

        String id = request.getParameter("id");
        String recentViewed = "";
        if (id != null && !id.equals("")){
            Cookie[] cookies = request.getCookies();
            if(cookies != null ){
                for (Cookie c:cookies){
                    if (c.getName().equals("RecentViewed")){
                        recentViewed = c.getValue();
                    }
                }
            }
            recentViewed += id + "#";
            String[] viewed= recentViewed.split("#");
            if (viewed != null && viewed.length>10){
                recentViewed = recentViewed.substring(recentViewed.length()-12);
            }
            Cookie cookie = new Cookie("RecentViewed",recentViewed);
            response.addCookie(cookie);

            JDBConnection con = new JDBConnection();
            String sql = "select * from Book where ID = "+id;
            ResultSet resultSet = con.executeQuery(sql);
            if (resultSet.next()){
    %>
    <a href="index.jsp">Back to home</a>
    <h1><%=resultSet.getString("BookName")%></h1>
    <form action="/cartservlet" method="get">
        <input hidden="hidden" value="<%=resultSet.getString("ID")%>" name="bookid">
        <input hidden="hidden" name="action" value="add">
        <p>Price: <%=resultSet.getString("Price")%></p>
        <p>Amount: <%=resultSet.getString("Amount")%></p>
        <p>Press: <%=resultSet.getString("Press")%></p>
        <p>Author: <%=resultSet.getString("Author")%></p>
        <p>Buy: <input type="number" id="buyamount" value="1" name="buyamount"></p>
        <input type="submit">Add to Cart
    </form>


    <%--<a href="/cartservlet?id=<%=resultSet.getString("ID")%>&amount=buyamount">Add to Cart</a>--%>
    <%

            }
        }
        BookDAO bd = new BookDAO();
        ArrayList<Book> rv = bd.getRecentViewList(recentViewed);
        %>
        <h3>Recently Viewed</h3>
    <%
        if (rv != null){
            for (Book b:rv){
                if (b != null){
            %>
        <ul>
            <li><a href="detail.jsp?id=<%=b.getID()%>" ><%=b.getBookName()%> </a> </li>
        </ul>
    <%          }
            }
        }

    %>
    <%

    %>
</body>
</html>
