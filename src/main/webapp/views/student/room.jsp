<%--
  Created by IntelliJ IDEA.
  User: dl
  Date: 2019/5/3
  Time: 13:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <!-- Fonts-->
    <link rel="stylesheet" type="text/css" href="../../vendor/font-awesome/css/font-awesome.min.css">
    <!-- Vendors-->
    <link rel="stylesheet" type="text/css" href="../../vendor/bootstrap/css/grid.css">
    <link rel="stylesheet" type="text/css" href="../../css/main.css">
    <link rel="stylesheet" type="text/css" href="../../css/student.css">

</head>

<body>
<div class="page-wrap" id="root">

    <!-- header -->
    <header class="header header--fixed" id="header--absolute">
        <div class="container">
            <div class="header__inner">
                <div class="header__logo"><a href="index.html">新生报道系统</a></div>
                <div class="header__menu">

                    <!-- onepage-nav -->
                    <nav class="onepage-nav">

                        <!-- onepage-menu -->
                        <ul class="onepage-menu">
                            <li><a href="${pageContext.request.contextPath}index">主页</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}info">个人信息</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}pay">缴费信息</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}green">绿色通道</a>
                            </li>
                            <li class="current-menu-item"><a href="${pageContext.request.contextPath}room">寝室选择</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}confirm">确认报到</a>
                            </li>
                            <li><a href="/logout">退出登录</a>
                            </li>
                        </ul><!-- onepage-menu -->

                        <div class="navbar-toggle"><span></span><span></span><span></span></div>
                    </nav><!-- End / onepage-nav -->

                </div>
            </div>
        </div>
    </header><!-- End / header -->

    <!-- Content-->
    <div class="awe-content">

        <!-- hero -->
        <!--<section class="hero awe-text-center" id="id-1"> -->
        <section class="awe-section">
            <div><img src="../../img/ban11.jpg"/></div>
        </section><!-- End / hero -->

        <div class="inner-toolbar clearfix">
            <ul>
                <li data-sort-source data-sort-id="media-gallery">
                    <ul class="nav nav-pills nav-pills-danger">
                        <li>
                            <label class="hidden-xs">过滤:</label>
                        </li>
                        <li class="active">
                            <a data-option-value="*" href="#all">所有</a>
                        </li>
                        <li>
                            <a data-option-value=".optional" href="#optional">可选</a>
                        </li>
                        <li>
                            <a data-option-value=".not-optional" href="#not-optional">人数已满</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
        <section class="awe-section awe-section-class">
            <div class="row">

                <!-- Main Page -->
                <div class="main ">
                    <div class="media-gallery">
                        <div class="mg-main">

                            <div class="row mg-files" data-sort-destination data-sort-id="media-gallery">
                            <c:forEach items="${rooms}" var="room">
                                <c:if test="${room.roomStatus.equals(\"可选\")}">
                                <div class="isotope-item optional col-sm-6 col-md-4 col-lg-3">
                                </c:if>
                                <c:if test="${room.roomStatus.equals(\"已满\")}">
                                <div class="isotope-item not-optional col-sm-6 col-md-4 col-lg-3">
                                </c:if>
                                    <div class="thumbnail">
                                        <div class="thumb-preview">
                                            <div class="thumb-image">
                                                <img src="../../img/room.jpg" class="img-responsive">
                                            </div>
                                            <div class="mg-thumb-options">
                                                <div class="mg-toolbar" style="text-align: center;">
                                                    <label>选择</label>
                                                </div>0
                                            </div>
                                        </div>
                                        <h5 class="mg-title bk-fg-danger">${room.rno}</h5>
                                        <div class="mg-description">
                                            <small class="pull-left text-muted bk-fg-warning">${room.roomStatus}</small>
                                            <small class="pull-right text-muted bk-fg-primary">${room.currentSize}/${room.roomSize}</small>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Main Page -->
            </div>
            </div>
        </section>
    </div>
    <!-- End / Content-->
</div>

    <!-- Start hidden Info -->
    <input type="hidden" value="${IDNum}" id="IDNum" />
    <!-- End hidden Info -->


    <!-- footer -->
    <div class="footer">
        <div id="back-to-top"><i class="fa fa-angle-up"></i></div>
        <div class="container">
            <div class="footer__wrapper">
                <div class="footer__social">

                    <!-- social-icon -->
                    <a class="social-icon" href="#"><i class="social-icon__icon fa fa-facebook"></i>
                    </a><!-- End / social-icon -->


                    <!-- social-icon -->
                    <a class="social-icon" href="#"><i class="social-icon__icon fa fa-twitter"></i>
                    </a><!-- End / social-icon -->


                    <!-- social-icon -->
                    <a class="social-icon" href="#"><i class="social-icon__icon fa fa-google-plus"></i>
                    </a><!-- End / social-icon -->


                    <!-- social-icon -->
                    <a class="social-icon" href="#"><i class="social-icon__icon fa fa-instagram"></i>
                    </a><!-- End / social-icon -->

                </div>
                <p class="footer__copy">2019 &copy; 欢迎使用新生注册报到管理系统</p>
            </div>
        </div>
    </div><!-- End / footer -->

</div>


<!-- Vendors-->
<script type="text/javascript" src="../../vendor/js/jquery.min.js"></script>
<script type="text/javascript" src="../../plugins/imagesloaded/imagesloaded.pkgd.js"></script>

<!-- plugins -->
<script src="../../plugins/isotope/js/jquery.isotope.js"></script>
<!-- App-->
<script type="text/javascript" src="../../js/main.js"></script>
<script src="../../js/pages/studentRoom.js"></script>
</body>
</html>

