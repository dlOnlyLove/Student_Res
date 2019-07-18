<%--
  Created by IntelliJ IDEA.
  User: dl
  Date: 2019/4/28
  Time: 22:30
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
                            <li><a href="${pageContext.request.contextPath}pay">缴费信息</a>
                            </li>
                            <li class="current-menu-item"><a href="${pageContext.request.contextPath}green">绿色通道</a>
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

    <!-- Content-->
    <div class="awe-content">

        <!-- hero -->
        <!--<section class="hero awe-text-center" id="id-1"> -->
        <section class="awe-section">
            <div><img src="../../img/ban11.jpg"/></div>
        </section><!-- End / hero -->


        <section class="awe-section awe-section-pay">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <form id="form" class="form-horizontal" method="post">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">专业</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="major" class="form-control" value="${student.major}" disabled/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">身份证号</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="IDNum" class="form-control" value="${student.IDNum}" disabled/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">姓名</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="name" class="form-control" value="${student.name}" disabled/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">学年学费</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="tuition" class="form-control" value="￥4500" disabled/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">学年住宿费</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="dormitoryFee" class="form-control" value="￥800" disabled/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="select">军训服装</label>
                                    <div class="col-md-9">
                                        <select id="select" name="costumes" class="form-control" size="1">
                                            <option value="0">请选择</option>
                                            <option value="100">是</option>
                                            <option value="0">否</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">手机号码</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="tel" class="form-control" value="${student.tel}"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">生源地贷款金额</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="loan" class="form-control" placeholder="请输入贷款金额"  required/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">证明材料上传</label>
                                    <div class="col-sm-9">
                                        <input type="file" name="proofMaterial" class="form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">审核结果</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="green" class="form-control" value="${green}" disabled/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-9 col-sm-offset-3">
                                        <button type="button" class="bk-margin-5 btn-plus btn-info"
                                                <c:if test="${green.equals(\"待审核\")}">disabled </c:if>
                                                <c:if test="${green.equals(\"审核通过\")}">disabled </c:if>
                                        >
                                            提交
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
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
<!-- Vendors-->
<script type="text/javascript" src="../../vendor/js/jquery.min.js"></script>
<!-- App-->
<script type="text/javascript" src="../../js/main.js"></script>
<script type="text/javascript" src="../../js/pages/studentgreen.js"></script>
</body>
</html>
