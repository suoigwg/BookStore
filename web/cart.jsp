<%@ page import="ch.ysyang.ecommerce.Cart" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="ch.ysyang.ecommerce.Book" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Collection" %><%--
  Created by IntelliJ IDEA.
  User: ysyang
  Date: 12/12/2016
  Time: 6:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cart</title>
</head>
<body>
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
                    <td><a href="/cartservlet?action=remove&bookid=<%=b.getID()%>&buyamount=<%=amt.toString()%>">Delete</a></td>
                    <td><a href="/cartservlet?action=removeone&bookid=<%=b.getID()%>&buyamount=<%=amt.toString()%>">Decrease One</a></td>
                    <td><a href="/cartservlet?action=addone&bookid=<%=b.getID()%>&buyamount=<%=amt.toString()%>">Increase One</a></td>

                </tr>
    <%
            }
            %>
        <tr>
            <td>Total Price: <%=c.getTotalPrice()%></td>
            <td><a href="/cartservlet?action=empty">Empty Cart</a></td>
            <td><a href="order.jsp">Make Payment</a></td>
            <td><a href="index.jsp">Back Home</a></td>
        </tr>
        <%
        }
    %>

    </table>

</body>
</html>
