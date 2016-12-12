<%--
  Created by IntelliJ IDEA.
  User: ysyang
  Date: 11/12/2016
  Time: 8:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="ch.ysyang.ecommerce.JDBConnection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<html>
<head>
    <title>Search Result</title>
</head>
<body>
    <h1>Search Results For </h1>
    <h2><%=request.getParameter("keyword")%></h2>
    <table>
        <tr>
            <td>BookName</td>
            <td>Price</td>
            <td>Amount</td>
            <td>Press</td>
        </tr>

            <%
            request.setCharacterEncoding("utf-8");
            String keyword = request.getParameter("keyword");
            System.out.print(keyword);
      JDBConnection con = new JDBConnection();
      String sql = "select * from Book where BookName like '%"+keyword+"%' or Press like '%"+keyword+"%'";
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
</body>
</html>
