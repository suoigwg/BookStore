<%@ page import="ch.ysyang.ecommerce.Book" %>
<%@ page import="ch.ysyang.ecommerce.Cart" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Set" %><%--
  Created by IntelliJ IDEA.
  User: ysyang
  Date: 12/12/2016
  Time: 8:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/custom.css">
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <title>我的订单</title>
</head>
<body>
<h1>请确认您的订单</h1>
<table class="table table-hover">
        <%
            request.setCharacterEncoding("utf-8");
            if (session.getAttribute("cart") == null){
        %>
    <h3>您的购物车为空</h3>
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
            <td>书名:   <%=b.getBookName()%>
            </td>
            <td>价格:      <%=b.getPrice()%>
            </td>
            <td>出版社:      <%=b.getPress()%>
            </td>
            <td>作者:     <%=b.getAuthor()%>
            </td>
            <td>数目:     <%=amt%>
            </td>

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
<h1>请确认您的收货地址</h1>
<%--<form class="form-group" action="/order" method="post">--%>
<%----%>
<%--<table>--%>
<%--<tr>--%>
<%--<td>收件人: <input type="text" name="receiver" value="TestRecevier"></td>--%>
<%--</tr>--%>
<%--<tr>--%>
<%--<td>地址: <input type="text" name="address" value="TestAddr"></td>--%>
<%--</tr>--%>
<%--<tr>--%>
<%--<td>联系方式: <input type="number" size="11" name="mobile" value="133323"></td>--%>
<%--</tr>--%>
<%--<tr><td><input type="submit" value="Confirm"></td></tr>--%>
<%--</table>--%>
<%--</form>--%>

<form class="form-inline" action="/order" method="post">
    <div class="form-group">
        <label for="exampleInputEmail1">收件人</label>
        <input class="form-control" id="exampleInputEmail1" placeholder="" name="receiver">
    </div>
    <div class="form-group">
        <label for="exampleInputPassword1">地址</label>
        <input class="form-control" id="exampleInputPassword1" placeholder="地址" name="address">
    </div>
    <div class="form-group">
        <label for="exampleInputFile">联系电话</label>
        <input id="exampleInputFile" name="mobile">
    </div>
    <div class="checkbox">
        <label>
            <input type="checkbox"> 保存收货信息
        </label>
    </div>
    <button type="submit" class="btn btn-default">提交</button>
</form>


</body>
</html>
