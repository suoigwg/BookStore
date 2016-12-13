<%--
  Created by IntelliJ IDEA.
  User: ysyang
  Date: 13/12/2016
  Time: 9:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" >
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <title>Title</title>
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="#">Nozama</a>
        </div>


        <form class="navbar-form navbar-left pull-right" method="get" action="search_handler.jsp">
            <span class="hidden-xs">
                <%
                    if (session.getAttribute("username")!=null){
                        %>
                <span><%=session.getAttribute("username")%>&nbsp;&nbsp;</span>
                <a href="logout.jsp">Logout</a>&nbsp;&nbsp;
                <%
                    }else{
                        %>
                    <a href="login.jsp" >Login</a>&nbsp;&nbsp;
                    <a href="register.jsp">Register</a>&nbsp;&nbsp;
                <%
                    }
                %>
                <a href="manage.jsp" hidden="hidden">Manage</a>&nbsp;&nbsp;
                <a href="cart.jsp">My Cart</a>&nbsp;&nbsp;
                <a href="orderlist.jsp">My Order</a>&nbsp;&nbsp;
            </span>

            <div class="form-group hidden-xs">
                    <input name="keyword" type="text" class="form-control" placeholder="Search">
                    <button type="submit" class="btn btn-default  hidden-xs" >Search</button>

            </div>

        </form>
    </div><!-- /.container-fluid -->
</nav>
</body>
</html>
