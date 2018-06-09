<%--
  Created by IntelliJ IDEA.
  User: ysyang
  Date: 10/12/2016
  Time: 2:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" %>
<html>
<head>
    <title>Welcome to Nozama!</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <%@include file="navbar.html" %>
    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="d-block w-100"
                     src="img/AmazonGW_DesktopHero_AVD_11773_ComingSoon_June_3000x600_EN_v1._CB477626147_.jpg"
                     alt="First slide">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="img/Blink_GW_DesktopHero_Evergreen_3000x600_v1._CB499532366_.jpg"
                     alt="Second slide">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="img/HERO_M_S_Sunglasses_2x._CB495098700_.jpg" alt="Third slide">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <div class="row mx-1 my-3">
        <div class="card col-lg-4  ">
            <div class="card-body" style="margin-top: 40%">
                <h5 class="card-title">Best place to find the book you love</h5>
                <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                <a href="login.jsp" class="btn btn-primary">Login</a>
            </div>
        </div>
        <div class="card col-lg-4 text-center ">
            <img class="card-img-top" src="img/gaokao.jpg">
            <div class="card-body">
                <h5 class="card-title ">Millions of exclusive books</h5>
            </div>
        </div>
        <div class="card col-lg-4 text-center">
            <img src="img/mayuan.jpg" class="card-img-top">
            <div class="card-body py-5 px-5">
                <h4 class="card-title">Once started</h4>
                <p class="lead">you can never stop</p>
            </div>
        </div>
    </div>
    <div class="card mt-2">
        <div class="card-header">
            Praises
        </div>
        <div class="card-body ">
            <blockquote class="blockquote mb-0">
                <p>Best store for everyone</p>
                <footer class="blockquote-footer"><cite title="Source Title">鲁迅</cite></footer>
            </blockquote>
        </div>
    </div>
    <%@include file="footer.html" %>
</div>

</body>
</html>
