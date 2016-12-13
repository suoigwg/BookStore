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
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" >
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <title>Welcome to Nozama!</title>
  </head>
  <body>
  <jsp:include page="navbar.jsp"></jsp:include>

  <div class="container">
    <form method="get" action="search_handler.jsp">
      <div class="input-group input-group-md">
        <input type="text" name="keyword" class="form-control">
        <span class="input-group-btn"><button class=" btn btn-default" type="submit" value="Search">Search</button></span>
      </div>
    </form>
  </div>

  <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
      <li data-target="#carousel-example-generic" data-slide-to="1"></li>
      <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="/img/us1.jpg" alt="holiday">
        <div class="carousel-caption">

        </div>
      </div>
      <div class="item">
        <img src="/img/us2.jpg" alt="holiday2">
        <div class="carousel-caption">

        </div>
      </div>
      <div class="item">
        <img src="/img/us3.jpg" alt="holiday3">
        <div class="carousel-caption">

        </div>
      </div>
    </div>

    <!-- Controls -->
    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>

  <table class="table table-bordered table-striped table-hover">
    <tr>
      <td>BookName</td>
    </tr>
    <%
      JDBConnection con = new JDBConnection();
      String sql = "select * from Book limit 50";
      ResultSet resultSet = con.executeQuery(sql);
      while (resultSet.next()){
    %>
    <tr>
      <td><a href="detail.jsp?id=<%=resultSet.getString("ID")%>"><%=resultSet.getString("BookName")%></a></td>
    </tr>


    <%

      }
    %>
  </table>
  </body>
</html>
