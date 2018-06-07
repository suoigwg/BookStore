<%@ page import="java.sql.ResultSet" %>
<%@ page import="blog.yisheng.bookstore.db.JDBConnection" %><%--
  Created by IntelliJ IDEA.
  User: ysyang
  Date: 12/12/2016
  Time: 1:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <title>Manage</title>
</head>
<body>
<form class="form-group" action="/addbook" method="post">
    <h1>添加商品</h1>
    <table class="table table-bordered">
        <tr>书名: <input type="text" size="100" name="bookname" value="testbook"></tr>
        <br>
            <tr>ISBN:       <input type="text" size="30" name="isbn" value="111111111"></tr><br>
        <tr>价格: <input type="text" name="price" value="10"></tr>
        <br>
        <tr>数目: <input type="text" name="stock" value="10"></tr>
        <br>
        <tr>出版社: <input type="text" name="press" size="45" value="TestPress"></tr>
        <br>
        <tr>作者： <input type="text" name="author" size="45" value="Tester"></tr>
        <br>
        <div class="btn btn-group-md">
            <input class="btn btn-lg" type="submit" value="Submit"> &nbsp; &nbsp; <input class="btn btn-lg" type="reset"
                                                                                         value="Reset">
        </div>
        </table>
    </form>
<h1>所有书籍</h1>
<table class="table table-condensed table-hover table-bordered">
        <tr>
            <td>书名</td>
            <td></td>
        </tr>
            <%
      JDBConnection con = new JDBConnection();
      String sql = "select * from Book limit 5400, 50";
      ResultSet resultSet = con.executeQuery(sql);
      while (resultSet.next()){
    %>
        <tr>
            <td><a href="detail.jsp?id=<%=resultSet.getString("ID")%>"><%=resultSet.getString("BookName")%></a></td>
            <td><a href="/delete?id=<%=resultSet.getString("ID")%>">删除</a></td>
        </tr>



            <%

      }
    %>

</body>
</html>
