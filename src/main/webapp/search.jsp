<%--
  Created by IntelliJ IDEA.
  User: ysyang
  Date: 11/12/2016
  Time: 8:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="blog.yisheng.bookstore.entity.Book" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<%@include file="header.html" %>
<body>

<div class="container">
    <%@include file="navbar.html" %>
    <div style="margin-top: 20px;">

        <%
            Object r = request.getAttribute("result");
            String keyword = request.getParameter("keyword");
            if (r == null)
                out.println("<h1>没有找到关于" + keyword + "的结果</h1>");
            else {
                out.println("<h1>以下是关于" + keyword + "的结果</h1>");
                out.println("<hr>");
            ArrayList<Book> result = (ArrayList<Book>) r;
                out.print("<table class=\"table table-hover table-bordered\">");
                out.print("<thead>");
                out.print("<tr>");
                out.print("<th scope=\"col\">书名</th>");
                out.print("<th scope=\"col\">作者</th>");
                out.print("<th scope=\"col\">出版社</th>");
                out.print("<th scope=\"col\">价格</th>");
                out.print("<th scope=\"col\">库存</th>");
                out.print("</tr>");
                out.print("</thead>");
                out.print("<tbody class=\"table-hover\">");
            for (Book book : result) {
                out.print("<td><a href=\"detail.jsp?id=" + book.getID() + "\">" + book.getTitle() + "</a></td>");
                out.print("<td>" + book.getAuthor() + "</td>");
                out.print("<td>" + book.getPress() + "</td>");
                out.print("<td>" + book.getPrice() + "</td>");
                out.print("<td>" + book.getStock() + "</td>");
                out.print("</tr>");
            }
                out.print("</tbody>");
                out.print("</table>");
            }

        %>
    </div>
</div>

</body>

</html>
