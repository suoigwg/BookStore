<%@ page import="java.sql.ResultSet" %>
<%@ page import="blog.yisheng.bookstore.db.JDBConnection" %><%--
  Created by IntelliJ IDEA.
  User: ysyang
  Date: 13/12/2016
  Time: 3:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/custom.css">
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <title>Order History</title>
</head>
<body>
    <%
        String email = (String) session.getAttribute("email");
        if (email == null){
            response.sendRedirect(request.getContextPath()+"index.jsp");
        }
        JDBConnection con = new JDBConnection();
        String sql = "select * from `Order` where email = '"+email+"'";
        ResultSet orderList = con.executeQuery(sql);
        while (orderList.next()){
            int orderid = orderList.getInt("orderid");

            %>
            <hr>


    <div class="container">
        <p class="text-right text-info">订单号: <%=orderid%> 日期 :<%=orderList.getTimestamp("data")%>
        </p>
        <div class="row">
            <table class="table table-condensed table-bordered table-hover">
                <tr>
                    <td>书名</td>
                    <td>ISBN</td>
                    <td>价格</td>
                    <td>数量</td>
                </tr>

                <%
                    String checkBookid = "select * from orderdetail where orderid = " + orderid;
                    ResultSet bookList = con.executeQuery(checkBookid);
                    while (bookList.next()) {
                        int bid = bookList.getInt("bookid");
                        int amount = bookList.getInt("amount");
                        String checkBookDetail = "select * from book where ID =" + bid;
                        ResultSet bookInfo = con.executeQuery(checkBookDetail);
                        while (bookInfo.next()) {
                %>

                <tr>
                    <td><%=bookInfo.getString("BookName")%>
                    </td>
                    <td><%=bookInfo.getString("ISBN")%>
                    </td>
                    <td><%=bookInfo.getDouble("Price")%>
                    </td>
                    <td><%=amount%>
                    </td>

                </tr>

                <% }
                }
                %>
            </table>
        </div>
    </div>

    <%
        }
    %>
</body>
</html>
