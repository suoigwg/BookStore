<%--
  Created by IntelliJ IDEA.
  User: ysyang
  Date: 11/12/2016
  Time: 9:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<%
    session.invalidate();
    out.print("You've successfully log out!");
    response.sendRedirect(request.getContextPath()+"index.jsp");
%>
<body>

</body>
</html>
