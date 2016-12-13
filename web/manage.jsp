<%@ page import="ch.ysyang.ecommerce.JDBConnection" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: ysyang
  Date: 12/12/2016
  Time: 1:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Manage</title>
</head>
<body>
    <form action="/addbook" method="post">
        <h1>Add books</h1>
        <table>
            <tr>BookName:   <input type="text" size="100" name="bookname" value="testbook"></tr><br>
            <tr>ISBN:       <input type="text" size="30" name="isbn" value="111111111"></tr><br>
            <tr>Price:      <input type="text" name="price" value="10"></tr><br>
            <tr>Amount:     <input type="text" name="amount" value="10"></tr><br>
            <tr>Press:      <input type="text" name="press" size="45" value="TestPress"></tr><br>
            <tr>Author      <input type="text" name="author" size="45" value="Tester"></tr><br>
            <tr><input type="submit" value="Submit"> &nbsp; &nbsp; <input type="reset" value="Reset"> </tr>
        </table>
    </form>
    <h1>All Books</h1>
    <table>
        <tr>
            <td>BookName</td>
        </tr>
            <%
      JDBConnection con = new JDBConnection();
      String sql = "select * from Book limit 5400, 50";
      ResultSet resultSet = con.executeQuery(sql);
      while (resultSet.next()){
    %>
        <tr>
            <td><a href="detail.jsp?id=<%=resultSet.getString("ID")%>"><%=resultSet.getString("BookName")%></a></td>
            <td><a href="/delete?id=<%=resultSet.getString("ID")%>">Delete</a></td>
        </tr>



            <%

      }
    %>

</body>
</html>
