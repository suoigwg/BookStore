<%@ page import="ch.ysyang.ecommerce.Cart" %>
<%@ page import="ch.ysyang.ecommerce.Book" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: ysyang
  Date: 12/12/2016
  Time: 8:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My order</title>
</head>
<body>
    <h1>Please confirm your order</h1>
    <table>
        <%
            if (session.getAttribute("cart") == null){
        %>
        <h1>Your cart is empty, check out the homepage</h1>
        <a href="index.jsp">Back home</a>
        <%
        }
        else{
            Cart c = (Cart) session.getAttribute("cart");
            c.printItemList();
            HashMap<Book,Integer> itemlist = c.getCartItems();
            Set<Book> booklist = itemlist.keySet();
            Collection<Integer> amountlist = itemlist.values();
            Iterator<Integer> ait = amountlist.iterator();
            Iterator<Book> bit = booklist.iterator();
            while (ait.hasNext() && bit.hasNext()){
                Book b = bit.next();
                Integer amt = ait.next();
        %>
        <tr>
            <td>BookName:   <%=b.getBookName()%></td>
            <td>Price:      <%=b.getPrice()%></td>
            <td>Press:      <%=b.getPress()%></td>
            <td>Author:     <%=b.getAuthor()%></td>
            <td>Amount:     <%=amt%></td>

        </tr>
        <%
            }
        %>
        <tr>
            <td>Total Price: <%=c.getTotalPrice()%></td>
        </tr>
        <%
            }
        %>

    </table>
    <h1>Please complete your receiving address</h1>
    <form action="/order" method="post">
        <table>
            <tr><td>Receiver: <input type="text" name="receiver" value="TestRecevier"></td></tr>
            <tr><td>Address: <input type="text" name="address" value="TestAddr"></td></tr>
            <tr><td>Mobile:  <input type="number" size="11" name="mobile" value="133323"></td></tr>
            <tr><td><input type="submit" value="Confirm"></td></tr>
        </table>
    </form>
</body>
</html>
