<%--
  Created by IntelliJ IDEA.
  User: ysyang
  Date: 11/12/2016
  Time: 8:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="ch.ysyang.ecommerce.JDBConnection" %>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <title>Search Result</title>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>

<div class="container">
    <div class="row">
        <h1 class="lead" id="searchResultTitle"><strong>Search Results For</strong> <%=request.getParameter("keyword")%>
        </h1>
    </div>

    <table class="table table-responsive table-hover">


            <%
            request.setCharacterEncoding("utf-8");
            String keyword = request.getParameter("keyword");
            System.out.print(keyword);
      JDBConnection con = new JDBConnection();
      String sql = "select * from Book where BookName like '%"+keyword+"%' or Press like '%"+keyword+"%'";
      ResultSet resultSet = con.executeQuery(sql);
      if(!resultSet.next()){
          out.print("No search results for "+ keyword);
      }
      else {
          %>
        <tr>
            <td><strong>Title</strong></td>
            <td><strong>Price</strong></td>
            <td><strong>Press</strong></td>
        </tr>
            <%

      }
      resultSet.beforeFirst();
      while (resultSet.next()){
    %>
        <tr>
            <td><a href="detail.jsp?id=<%=resultSet.getString("ID")%>"><%=resultSet.getString("BookName")%>
            </a></td>
            <td><%=resultSet.getString("Price")%>
            </td>
            <td><%=resultSet.getString("Press")%>
            </td>
        </tr>


            <%

      }
    %>
</div>


</body>

</html>
