<%--
  Created by IntelliJ IDEA.
  User: dl
  Date: 2019/5/24
  Time: 22:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes">


    <!-- start CSS -->

    <!-- Font CSS -->
    <link rel="stylesheet" type="text/css" href="../../vendor/font-awesome/css/font-awesome.min.css">

    <!-- Vendor CSS -->
    <link rel="stylesheet" type="text/css" href="../../vendor/bootstrap/css/grid.css">
    <link rel="stylesheet" type="text/css" href="../../vendor/bootstrap/css/bootstrap.min.css">

    <!-- Page CSS -->
    <link rel="stylesheet" type="text/css" href="../../css/main.css">
    <link rel="stylesheet" type="text/css" href="../../css/student.css">
    <link rel="stylesheet" type="text/css" href="../../css/style-manager.css">

    <!-- Plugins CSS -->
    <link href="../../plugins/bootkit/css/bootkit.css" rel="stylesheet" />
    <!-- end CSS -->

</head>

<body>
<div class="page-wrap" id="root">

    <!-- header -->
    <header class="header header--fixed" id="header--absolute">
        <div class="container">
            <div class="header__inner">
                <div class="header__logo"><a>新生报道系统</a></div>
                <div class="header__menu">

                    <!-- onepage-nav -->
                    <nav class="onepage-nav">

                        <!-- onepage-menu -->
                        <ul class="onepage-menu">
                            <li><a href="${pageContext.request.contextPath}index">主页</a>
                            </li>
                            <li ><a href="${pageContext.request.contextPath}info">个人信息</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}pay">缴费信息</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}green">绿色通道</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}room">寝室选择</a>
                            </li>
                            <li class="current-menu-item"><a href="${pageContext.request.contextPath}confirm">确认报到</a>
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


        <section class="awe-section" style="padding-top: 0; margin-top: -100px;">
            <b style="height: 30px; overflow: hidden; display: block;"></b>
            <div class="container">
                <div class="row">
                    <div class="timeline">
                        <div class="tm-body">
                            <div class="tm-title">
                                <h3 class="h5 text-uppercase">缴费详情</h3>
                            </div>
                            <ol class="tm-items">
                                <li>
                                    <div class="tm-info">
                                        <div class="tm-icon"><i class="fa fa-jpy"></i></div>
                                        <time class="tm-datetime" datetime="2015-03-27 09:34">
                                            <div class="tm-datetime-date bk-bg-white bk-radius text-center bk-padding-5">缴费</div>
                                            <div class="tm-datetime-time" style="color: deepskyblue; text-align: center;"><i class="fa fa-hand-o-up"></i></div>
                                        </time>
                                    </div>
                                    <div class="tm-box">
                                        <p>
                                            ${payResult}
                                        </p>
                                    </div>
                                </li>
                                <li>
                                    <div class="tm-info">
                                        <div class="tm-icon"><i class="fa fa-share"></i></div>
                                        <time class="tm-datetime" datetime="2015-03-15 08:19">
                                            <div class="tm-datetime-date bk-bg-white bk-radius text-center bk-padding-5">绿色通道</div>
                                            <div class="tm-datetime-time" style="color: deepskyblue; text-align: center;"><i class="fa fa-hand-o-up"></i></div>
                                        </time>
                                    </div>
                                    <div class="tm-box">
                                        <p>
                                            ${green}
                                        </p>
                                    </div>
                                </li>
                            </ol>
                            <div class="tm-title">
                                <h3 class="h5 text-uppercase">寝室选择</h3>
                            </div>
                            <ol class="tm-items">
                                <li>
                                    <div class="tm-info">
                                        <div class="tm-icon"><i class="fa fa-home"></i></div>
                                        <time class="tm-datetime" datetime="2014-12-25 07:45">
                                            <div class="tm-datetime-date bk-bg-white bk-radius text-center bk-padding-5">寝室选择</div>
                                            <div class="tm-datetime-time" style="color: deepskyblue; text-align: center;"><i class="fa fa-hand-o-up"></i></div>
                                        </time>
                                    </div>
                                    <div class="tm-box">
                                        <p>
                                            ${roomSelectResult}
                                        </p>
                                    </div>
                                </li>
                            </ol>
                            <div class="tm-title">
                                <a id="resAction" style="color: blue;"  href="javascript:void(0)" onclick="resAction();"
                                    <h3 class="h5 text-uppercase">${registration}</h3>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </div>
    <!-- End / Content-->

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


<!-- start: JavaScript -->

<!-- Vendor JS -->
<script type="text/javascript" src="../../vendor/js/jquery.min.js"></script>
<script type="text/javascript" src="../../vendor/bootstrap/js/bootstrap.min.js"></script>

<script>
    $(function(){
        var registration = "${registration}";
        var obj = $("#resAction");
        if(registration == "已报到") {
            obj.removeAttr('href');
            obj.removeAttr('onclick');
            obj.attr("disabled",true);
        }
    });
    function resAction() {
        var flag = true;
        if (("${payResult}" == "缴费未完成！请及时缴费") && !("${green}" == "审核通过")) {
            flag = false;
        }
        if ("${roomSelectResult}" == "寝室未选择！请及时选择寝室") {
            flag = false;
        }
        if (flag) {
            window.location.href = "${pageContext.request.contextPath}confirmResAction";
        } else {
            alert("报到项目未完成,请及时完成报到！");
        }
    }
</script>

<!-- end: JavaScript-->


</body>
</html>

