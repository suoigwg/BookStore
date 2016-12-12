<%--
  Created by IntelliJ IDEA.
  User: ysyang
  Date: 10/12/2016
  Time: 2:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="ch.ysyang.ecommerce.JDBConnection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<html>
  <head>
    <title>Welcome to Nozama!</title>
  </head>
  <body>
  <a href="login.jsp">Login</a>
  <a href="register.jsp">Register</a>
  <a href="login_status_check.jsp">Login Check</a>
  <h1>Welcome to Nozama!</h1>
  <hr>
  <form method="get" action="search_handler.jsp">
    Search: <input type="text" name="keyword">
    <input type="submit" value="Search">
  </form>

  <table>
    <tr>
      <td>BookName</td>
      <td>Price</td>
      <td>Amount</td>
      <td>Press</td>
    </tr>
    <%
      JDBConnection con = new JDBConnection();
      String sql = "select * from Book";
      ResultSet resultSet = con.executeQuery(sql);
      while (resultSet.next()){
    %>
    <tr>
      <td><%=resultSet.getString("BookName")%></td>
      <td><%=resultSet.getString("Price")%></td>
      <td><%=resultSet.getString("Amount")%></td>
      <td><%=resultSet.getString("Press")%></td>
    </tr>


    <%

      }
    %>
  </table>
  </body>
</html>
