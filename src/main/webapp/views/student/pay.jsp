<%--
  Created by IntelliJ IDEA.
  User: dl
  Date: 2019/4/26
  Time: 23:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
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
    <!-- App & fonts-->
    <link rel="stylesheet" type="text/css" href="../../css/main.css">
    <link rel="stylesheet" type="text/css" href="../../css/student.css">
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
                            <li><a href="${pageContext.request.contextPath}info">个人信息</a>
                            </li>
                            <li class="current-menu-item"><a href="${pageContext.request.contextPath}pay">缴费信息</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}green">绿色通道</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}room">寝室选择</a>
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

    <!-- Content Start -->
    <div class="awe-content">

        <!-- hero -->
        <section class="awe-section">
            <div><img src="../../img/ban11.jpg"/></div>
        </section><!-- End / hero -->


        <section class="awe-section awe-section-pay">

            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                    <!-- panel Start -->
                    <div class="panel panel-default form-wizard" id="w4">

                        <!-- panel body Start -->
                        <div class="panel-body">

                            <!-- tab head Start -->
                            <div class="wizard-progress">
                                <div class="steps-progress">
                                    <div class="progress-indicator"></div>
                                </div>
                                <ul class="wizard-steps">
                                    <li class="active">
                                        <a href="#w4-account" data-toggle="tab"><span>1</span>确认信息</a>
                                    </li>
                                    <li>
                                        <a href="#w4-profile" data-toggle="tab"><span>2</span>缴费项目</a>
                                    </li>
                                    <li>
                                        <a href="#w4-confirm" data-toggle="tab"><span>3</span>确认缴费</a>
                                    </li>
                                </ul>
                            </div>
                            <!-- tab head End -->

                            <!-- tab Content Start -->
                            <form class="form-horizontal" novalidate="novalidate">
                                <div class="tab-content">

                                    <!-- tab pane Start-->
                                    <div id="w4-account" class="tab-pane active">
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead>
                                                <tr>
                                                    <th colspan="2">学生信息</th>
                                                </tr>
                                                </thead>
                                                <tbody>

                                                <tr>
                                                    <td>姓名</td>
                                                    <td class="table-border">${student.name}</td>
                                                </tr>
                                                <tr>
                                                    <td>身份证号</td>
                                                    <td class="table-border">${student.IDNum}</td>
                                                </tr>
                                                <tr>
                                                    <td>电话</td>
                                                    <td class="table-border">${student.tel}</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    <div id="w4-profile" class="tab-pane">
                                        <div class="table-responsive">
                                            <table class="table-pay table" style="border: none;">
                                                <thead>
                                                <tr>
                                                    <th>缴费项目</th>
                                                    <th>缴费金额</th>
                                                    <th class="text-left">选择</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td >学费</td>
                                                    <td class="table-border">￥3700</td>
                                                    <td>
                                                        <div class="checkbox-custom checkbox-success">
                                                            <input style="text-align: center;" type="checkbox" name="terms" checked disabled>
                                                            <label></label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>住宿费</td>
                                                    <td class="table-border">￥800</td>
                                                    <td>
                                                        <div class="checkbox-custom checkbox-success">
                                                            <input type="checkbox" name="terms" checked disabled>
                                                            <label></label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>军训服装费</td>
                                                    <td class="table-border">￥100</td>
                                                    <td>
                                                        <div class="checkbox-custom checkbox-success">
                                                            <input type="checkbox" name="pay">
                                                            <label></label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    <div id="w4-confirm" class="tab-pane">
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead>
                                                <tr>
                                                    <th style="text-align: right;">学生信息</th>
                                                    <th></th>
                                                    <th style="text-align: right;">缴费信息</th>
                                                    <th></th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td style="text-align: right;">姓名</td>
                                                    <td class="table-border" style="text-align: left;">${student.name}</td>
                                                    <td style="text-align: right;">学费</td>
                                                    <td class="table-border" style="text-align: left;">￥3700</td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right;">身份证号</td>
                                                    <td class="table-border" style="text-align: left;">${student.IDNum}</td>
                                                    <td style="text-align: right;">住宿费</td>
                                                    <td class="table-border" style="text-align: left;">￥800</td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right;">电话</td>
                                                    <td class="table-border" style="text-align: left;">${student.tel}</td>
                                                    <td style="text-align: right;">军训服装费</td>
                                                    <td class="table-border" id="dressMoney" style="text-align: left;">￥0</td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                    <td class="table-border"></td>
                                                    <td style="text-align: right;">总计</td>
                                                    <td class="table-border" id="totalMoney" style="text-align: left;">￥3700</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>

                                    </div>
                                    <!-- tab pane End -->

                                </div>
                            </form>
                            <!-- tab Content End -->

                            <!-- tab Foot Start -->
                            <div class="panel-footer bk-bg-very-light-gray bk-radius">
                                <ul class="pager bk-margin-off">
                                    <li class="previous disabled">
                                        <a><i class="fa fa-angle-left"></i> 上一步</a>
                                    </li>
                                    <li class="finish hidden pull-right" id="finish">
                                        <a>支付</a>
                                    </li>
                                    <li class="next">
                                        <a>下一步<i class="fa fa-angle-right"></i></a>
                                    </li>
                                </ul>
                            </div>
                            <!-- tab Foot End -->

                        </div>
                        <!-- panel body End -->

                    </div>
                    <!-- panel End -->

                </div>
            </div>

        </section>

    </div>
    <!-- Content End -->

    <form action="${pageContext.request.contextPath}alipayAction" id="payForm" class="hidden">
        <input type="hidden" name="out_trade_no" />
        <input type="hidden" name="total_amount" />
    </form>

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


<!-- start: JavaScript-->

<!-- Vendors-->
<script type="text/javascript" src="../../vendor/js/jquery.min.js"></script>
<script type="text/javascript" src="../../vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- plugins -->
<script src="../../plugins/wizard/jquery.bootstrap.wizard.js"></script>
<script src="../../plugins/jquery-validation/jquery.validate.js"></script>

<!-- App-->
<script type="text/javascript" src="../../js/main.js"></script>
<script src="../../js/pages/studentpay.js"></script>

<!-- end: JavaScript-->


</body>
</html>
