<%@ page import="java.util.Collection" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Set" %>
<%@ page import="blog.yisheng.bookstore.entity.Book" %>
<%@ page import="blog.yisheng.bookstore.entity.Cart" %><%--
  Created by IntelliJ IDEA.
  User: ysyang
  Date: 12/12/2016
  Time: 9:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/custom.css">
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <title>订单详情</title>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>

<div class="container">
    <h1>您的订单正在处理中</h1>
    <hr>
    <h3>订单详情</h3>
    <table class="table table-hover">
        <%
            request.setCharacterEncoding("utf-8");
            Cart c = null;
            if (session.getAttribute("cart") == null){
                System.out.print("您的购物车是空的");
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
            session.setAttribute("cart", null);
        %>
        <tr>
            <td>总价: <%=c.getTotalPrice()%>
            </td>
        </tr>
    </table>
    <br><br>
    <hr>
    <h3>收货人信息</h3>
    <table class="table table-hover">
        <tr>
            <td>收货人: <%=request.getParameter("receiver")%>
            </td>
        </tr>
        <tr>
            <td>地址: <%=request.getParameter("address")%>
            </td>
        </tr>
        <tr>
            <td>联系方式: <%=request.getParameter("mobile")%>
            </td>
        </tr>
    </table>

</div>
</body>
</html>
