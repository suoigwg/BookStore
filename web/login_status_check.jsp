<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: ysyang
  Date: 11/12/2016
  Time: 8:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Object obj = session.getAttribute("username");
    if(obj==null){
        out.print("你没有登录");
        out.print("<a href=\"login.jsp\">Login</a>");
    }else{
        request.getRequestDispatcher(request.getContextPath()+"index.jsp").forward(request,response);

    }
%>

</body>
</html>
