<%--
  Created by IntelliJ IDEA.
  User: dl
  Date: 2019/4/25
  Time: 16:50
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

    <!-- end CSS -->

    <script>
        var globalSex = "${student.sex}";
        var globalBirthday = "${student.birthday}";
    </script>

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
                            <li class="current-menu-item"><a href="${pageContext.request.contextPath}info">个人信息</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}pay">缴费信息</a>
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

    <!-- Content-->
    <div class="awe-content">

        <!-- hero -->
        <!--<section class="hero awe-text-center" id="id-1"> -->
        <section class="awe-section">
            <div><img src="../../img/ban11.jpg"/></div>
        </section><!-- End / hero -->


        <section class="awe-section">
            <b style="height: 30px; overflow: hidden; display: block;"></b>
            <div class="container">
                <div class="tabs tabs-primary">
                    <ul class="nav nav-tabs nav-justified">
                        <li class="active" ><a href="#tab1" data-toggle="tab" class="text-center">资料设置</a></li>
                        <li><a href="#tab2" data-toggle="tab" class="text-center">密码修改</a></li>
                    </ul>

                    <div class="tab-content">
                        <!-- ac-tab__panel -->
                        <div class="tab-pane active" id="tab1">
                            <form class="form-horizontal" id="infoForm">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">用户名</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="name" class="form-control" value="${student.name}" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">身份证号</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="IDNum" class="form-control" value="${student.IDNum}" disabled/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">年龄</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="age" class="form-control" value="${student.age}"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">性别</label>
                                    <div class="col-sm-9">
                                        <div  style="margin:0 0 10px 0">
                                            <div class="radio-custom radio-inline" style="display:inline-block;">
                                                <input type="radio" id="male" name="sex" value="男">
                                                <label for="male">男</label>
                                            </div>
                                            <div class="radio-custom radio-inline" style="display:inline-block">
                                                <input type="radio" id="female" name="sex" value="女">
                                                <label for="female">女</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">生日</label>
                                    <div class="col-sm-9">
                                        <input type="date" name="birthday" class="form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">手机号码</label>
                                    <div class="col-sm-9">
                                        <input name="tel" class="form-control" value="${student.tel}" required />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-9 col-sm-offset-3">
                                        <div class="bk-margin-right-15">
                                            <button  id="saveProfile" type="button" class="btn btn-primary">保存</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- End / ac-tab__panel -->


                        <!-- ac-tab__panel -->
                        <div class="tab-pane" id="tab2">
                            <form class="form-horizontal" id="resetPwdForm">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">原始密码</label>
                                    <div class="col-sm-9">
                                        <input type="password" name="oldPwd" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">新密码</label>
                                    <div class="col-sm-9">
                                        <input type="password" name="newPwd" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">确认密码</label>
                                    <div class="col-sm-9">
                                        <input type="password" name="confirmPwd" class="form-control"/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-9 col-sm-offset-3">
                                        <div class="bk-margin-right-15">
                                            <button  id="resetPwd" type="button" class="btn btn-primary">保存</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- End / ac-tab__panel -->


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

<!-- Page JS -->
<script type="text/javascript" src="../../js/pages/studentinfo.js"></script>

<!-- end: JavaScript-->


</body>
</html>
