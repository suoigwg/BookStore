<%@ page import="ch.ysyang.ecommerce.JDBConnection" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: ysyang
  Date: 29/12/2016
  Time: 6:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <title>Title</title>
</head>
<body>
<%
    int typeid = Integer.parseInt(request.getParameter("typeid"));
    String catelog = "";
    switch (typeid) {
        case 1:
            catelog = "教材教辅";
            break;
        case 2:
            catelog = "文学名著";
            break;
        case 3:
            catelog = "儿童读物";
            break;
        default:
            break;
    }
%>

<div class="container">
    <div class="row">
        <h1><%=catelog%>
        </h1>
    </div>
    <table class="table table-responsive table-hover">
            <%
            request.setCharacterEncoding("utf-8");
//            System.out.print(typeid);
            JDBConnection con = new JDBConnection();
            String sql = "select * from Book where ID > "+typeid * 1000+ " and ID < " + typeid*1000+1000;
            ResultSet resultSet = con.executeQuery(sql);
            if(!resultSet.next()){
                out.print("No search results for "+ typeid);
            }
            else {
          %>
        <tr>
            <td><strong>标题</strong></td>
            <td><strong>价格</strong></td>
            <td><strong>出版社</strong></td>
        </tr>
            <%

      }
      resultSet.beforeFirst();
      while (resultSet.next()){
    %>
        <tr>
            <td><a href="detail.jsp?id=<%=resultSet.getString("><%=resultSet.getString("BookName")%>
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
