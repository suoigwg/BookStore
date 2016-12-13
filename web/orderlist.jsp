<%@ page import="ch.ysyang.ecommerce.JDBConnection" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: ysyang
  Date: 13/12/2016
  Time: 3:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

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
            Order ID: <%=orderid%>
            Data    :<%=orderList.getTimestamp("data")%>

    <table>
        <tr>
            <td>BookName</td>
            <td>ISBN</td>
            <td>Price</td>
            <td>Amount</td>
        </tr>

            <%
                String checkBookid = "select * from orderdetail where orderid = "+orderid;
                ResultSet bookList = con.executeQuery(checkBookid);
                while (bookList.next()){
                    int bid = bookList.getInt("bookid");
                    int amount = bookList.getInt("amount");
                    String checkBookDetail = "select * from book where ID ="+bid;
                    ResultSet bookInfo = con.executeQuery(checkBookDetail);
                    while (bookInfo.next()){
                    %>

                    <tr>
                        <td><%=bookInfo.getString("BookName")%></td>
                        <td><%=bookInfo.getString("ISBN")%></td>
                        <td><%=bookInfo.getDouble("Price")%></td>
                        <td><%=amount%></td>

                    </tr>

    <%              }
                }
               %>
    </table>
    <%
        }
    %>
</body>
</html>
