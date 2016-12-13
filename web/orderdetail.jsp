<%@ page import="ch.ysyang.ecommerce.Book" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Collection" %>
<%@ page import="ch.ysyang.ecommerce.Cart" %><%--
  Created by IntelliJ IDEA.
  User: ysyang
  Date: 12/12/2016
  Time: 9:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order Detail</title>
</head>
<body>
    <h1>Your order is now being processed!</h1>
    <hr>
    <h3>Order Description</h3>
    <table>
        <%
            Cart c = null;
            if (session.getAttribute("cart") == null){
                System.out.print("Empty cart!");
            }
            else{
                c = (Cart) session.getAttribute("cart");
            }
            HashMap<Book, Integer> itemList = c.getCartItems();
            Set<Book> booklist = itemList.keySet();
            Iterator<Book> bookListIterator = booklist.iterator();
            Collection<Integer> amountList = itemList.values();
            Iterator<Integer> amountIterator = amountList.iterator();
            while (bookListIterator.hasNext()){
                Book b = bookListIterator.next();
        %>
        <tr>
            <td><%=b.getBookName()%></td>
            <td><%=b.getPrice()%></td>
            <td><%=b.getPress()%></td>
            <td><%=amountIterator.next()%></td>
        </tr>

        <%
            }
        %>
        <tr><td>Total Price: <%=c.getTotalPrice()%></td></tr>
    </table>
    <br><br>
    <hr>
    <h3>Receiver Information</h3>
    <table>
        <tr><td>Receiver: <%=request.getParameter("receiver")%></td></tr>
        <tr><td>Address: <%=request.getParameter("address")%></td></tr>
        <tr><td>Mobile: <%=request.getParameter("mobile")%></td></tr>
    </table>
</body>
</html>
