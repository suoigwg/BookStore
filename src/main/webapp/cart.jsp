<%@ page import="blog.yisheng.bookstore.entity.Book" %>
<%@ page import="blog.yisheng.bookstore.dao.BookDAO" %>
<%@ page import="java.util.*" %>
<%@ page import="blog.yisheng.bookstore.entity.Cart" %>
<%--
  Created by IntelliJ IDEA.
  User: ysyang
  Date: 12/12/2016
  Time: 6:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/custom.css">
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <title>购物车</title>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
<div class="container">
    <table class="table table-hovered ">
        <%
            if (session.getAttribute("cart") == null) {
            %>

        <%
            String recentViewed = "";
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie c : cookies) {
                    if (c.getName().equals("RecentViewed")) {
                        recentViewed = c.getValue();
                    }
                }
            }

        %>


        <div class="container" id="emptyCartMsg">
            <h1>您的购物车是空的</h1>
            <p class="lead">您最近浏览过的商品
            </p>
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <%
                        BookDAO bd = new BookDAO();
                        ArrayList<Book> rv = bd.getRecentViewList(recentViewed);

                        if (rv != null) {
                            for (Book b : rv) {
                                if (b != null) {
                    %>
                    <ul>
                        <li><a href="detail.jsp?id=<%=b.getID()%>"><%=b.getBookName()%>
                        </a></li>
                    </ul>
                    <% }
                    }
                    }
                    %>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6" align="center">
                    <%
                        if (session.getAttribute("email") == null) {
                    %>
                    <p class="text-center">注册以获得更好体验</p>
                    <a href="login.jsp">
                        <button type="button" class="btn btn-primary btn-lg">Sign in</button>
                    </a>
                    <%
                    } else {
                    %>
                    <p class="lead">欢迎 <span><%=session.getAttribute("username")%></span></p>
                    <%
                        }
                    %>
                </div>

            </div>
        </div>


        <%
        } else {
            Cart c = (Cart) session.getAttribute("cart");
            c.printItemList();
            HashMap<Book, Integer> itemlist = c.getCartItems();
            Set<Book> booklist = itemlist.keySet();
            Collection<Integer> amountlist = itemlist.values();
            Iterator<Integer> ait = amountlist.iterator();
            Iterator<Book> bit = booklist.iterator();
        %>
        <tr>
            <td>书名</td>
            <td>价格</td>
            <td>出版社</td>
            <td>作者</td>
        </tr>

        <%
            while (ait.hasNext() && bit.hasNext()) {
                Book b = bit.next();
                Integer amt = ait.next();
        %>
        <tr>
            <td><%=b.getBookName()%>
            </td>
            <td><%=b.getPrice()%>
            </td>
            <td><%=b.getPress()%>
            </td>
            <td><%=b.getAuthor()%>
            </td>
            <td><%=amt%>
            </td>
            <td>数目</td>
            <td><a href="/cartservlet?action=remove&bookid=<%=b.getID()%>&buyamount=<%=amt.toString()%>">删除 </a></td>
            <td><a href="/cartservlet?action=removeone&bookid=<%=b.getID()%>&buyamount=<%=amt.toString()%>">-1 </a></td>
            <td><a href="/cartservlet?action=addone&bookid=<%=b.getID()%>&buyamount=<%=amt.toString()%>">+1 </a></td>

        </tr>
        <%
            }
            %>
        <tr>
            <td>总金额: <%=c.getTotalPrice()%>
            </td>
            <td><a href="/cartservlet?action=empty">清空购物车 </a></td>
            <td><a href="order.jsp">支付</a></td>
        </tr>
        <%
            }
        %>

    </table>
</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
