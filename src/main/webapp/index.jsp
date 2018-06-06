<%@ page import="java.util.Random" %><%--
  Created by IntelliJ IDEA.
  User: ysyang
  Date: 10/12/2016
  Time: 2:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Welcome to Nozama!</title>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>

  <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
      <li data-target="#carousel-example-generic" data-slide-to="1"></li>
      <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="/img/book.png" alt="holiday">
        <div class="carousel-caption">

        </div>
      </div>
      <div class="item">
        <img src="/img/book.png" alt="holiday2">
        <div class="carousel-caption">

        </div>
      </div>
      <div class="item">
        <img src="/img/book.png" alt="holiday3">
        <div class="carousel-caption">

        </div>
      </div>
    </div>

    <!-- Controls -->
    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>

<br><br>

<div class="container">
  <div class="row">

    <div class="col-lg-3">
      <%
        if (session.getAttribute("username") == null) {
      %>
      <p class="lead text-center">欢迎</p>
      <a href="register.jsp" class="text-center">
        <button type="button" class="btn btn-lg btn-primary btn-block">登录</button>
      </a>
      <%
      } else {
      %>
      <br><br><br>
      <p class="lead text-center">欢迎 <%=session.getAttribute("username")%>
      </p>
      <%
        }
      %>
    </div>
    <div class="col-lg-3">

    </div>


    <div class="col-lg-6">


      <%
        Random ran = new Random();
        int x = ran.nextInt(4000) + 5;
      %>
      <p class="lead text-left"><a href="detail.jsp?id=<%=x%>">随便看看</a></p>

      <p class="lead text-left">按目录浏览</p>
      <ul>
        <li><a href="catelog.jsp?typeid=1">教材教辅</a></li>
        <li><a href="catelog.jsp?typeid=2">文学名著</a></li>
        <li><a href="catelog.jsp?typeid=3">儿童读物</a></li>

      </ul>
    </div>
  </div>

</div>

<jsp:include page="footer.jsp"></jsp:include>
  </body>
</html>
