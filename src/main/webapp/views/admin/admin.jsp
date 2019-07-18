<%--
  Created by IntelliJ IDEA.
  User: dl
  Date: 2019/3/22
  Time: 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <!-- Basic -->
    <meta charset="UTF-8" />

    <title>高校新生注册报到系统主页</title>

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="../../ico/favicon.ico" type="image/x-icon" />
    <link rel="apple-touch-icon" href="../../ico/apple-touch-icon.png" />
    <link rel="apple-touch-icon" sizes="57x57" href="../../ico/apple-touch-icon-57x57.png" />
    <link rel="apple-touch-icon" sizes="72x72" href="../../ico/apple-touch-icon-72x72.png" />
    <link rel="apple-touch-icon" sizes="76x76" href="../../ico/apple-touch-icon-76x76.png" />
    <link rel="apple-touch-icon" sizes="114x114" href="../../ico/apple-touch-icon-114x114.png" />
    <link rel="apple-touch-icon" sizes="120x120" href="../../ico/apple-touch-icon-120x120.png" />
    <link rel="apple-touch-icon" sizes="144x144" href="../../ico/apple-touch-icon-144x144.png" />
    <link rel="apple-touch-icon" sizes="152x152" href="../../ico/apple-touch-icon-152x152.png" />

    <!-- start: CSS file-->

    <!-- Vendor CSS-->
    <link href="../../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../vendor/skycons/css/skycons.css" rel="stylesheet" />
    <link href="../../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../../vendor/css/pace.preloader.css" rel="stylesheet" />

    <!-- Plugins CSS-->
    <link href="../../plugins/bootkit/css/bootkit.css" rel="stylesheet" />
    <link href="../../plugins/owl-carousel/css/owl.carousel.css" rel="stylesheet" />
    <link href="../../plugins/owl-carousel/css/owl.theme.css" rel="stylesheet" />
    <link href="../../plugins/fullcalendar/css/fullcalendar.css" rel="stylesheet" />
    <link href="../../plugins/magnific-popup/css/magnific-popup.css" rel="stylesheet" />

    <!-- Page CSS -->
    <link href="../../css/style-manager.css" rel="stylesheet" />
    <link href="../../css/add-ons.min.css" rel="stylesheet" />

    <!-- end: CSS file-->


</head>

<body>

<!-- Start: Header -->
<div class="navbar" role="navigation">
    <div class="container-fluid container-nav">
        <!-- Navbar Action -->
        <ul class="nav navbar-nav navbar-actions navbar-left">
            <li class="visible-md visible-lg"><a href="#" id="main-menu-toggle"><i class="fa fa-th-large"></i></a></li>
            <li class="visible-xs visible-sm"><a href="#" id="sidebar-menu"><i class="fa fa-navicon"></i></a></li>
        </ul>
        <!-- Navbar Left -->

        <!-- Navbar Right -->
        <div class="navbar-right">
            <!-- Notifications -->
            <!-- End Notifications -->
            <!-- Userbox -->
            <div class="userbox">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <figure class="profile-picture hidden-xs">
                        <img src="../../img/avatar.jpg" class="img-circle" alt="" />
                    </figure>
                    <div class="profile-info">
                        <span class="name">${custom }</span>
                        <span class="role"><i class="fa fa-circle bk-fg-success"></i> 超级管理员</span>
                    </div>
                    <i class="fa custom-caret"></i>
                </a>
                <div class="dropdown-menu">
                    <ul class="list-unstyled">
                        <li class="dropdown-menu-header bk-bg-white bk-margin-top-15">
                        </li>
                        <li class="profile">
                            <a href="#demo-form" class="popup-with-form"><i class="fa fa-user"></i> 个人信息</a>
                        </li>
                        <li>
                            <a href="/logout"><i class="fa fa-power-off"></i> 退出登录</a>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- End Userbox -->
        </div>
        <!-- End Navbar Right -->
    </div>
</div>
<!-- End: Header -->


<!-- Start: Content -->
<div class="container-fluid content">
    <div class="row">

        <!-- Sidebar -->
        <div class="sidebar">
            <div class="sidebar-collapse">
                <!-- Sidebar Header Logo-->
                <div class="sidebar-header">
                    <img src="../../img/logo.png" class="img-responsive" alt="" />
                </div>
                <!-- Sidebar Menu-->
                <div class="sidebar-menu">
                    <nav id="menu" class="nav-main" role="navigation">
                        <ul class="nav nav-sidebar">
                            <div class="panel-body text-center">
                                <div class="flag">
                                    <img src="../../img/flags/CHINA.jpg" class="img-flags" alt="" />
                                </div>
                            </div>
                            <li class="active nav-parent">
                                <a>
                                    <i class="fa fa-laptop" aria-hidden="true"></i><span>信息管理</span>
                                </a>
                                <ul class="nav nav-children">
                                    <li><a href="${pageContext.request.contextPath}schoolRes"><span class="text">教务人员注册</span></a></li>
                                    <li><a href="${pageContext.request.contextPath}schoolInfo"><span class="text">教务人员信息</span></a></li>
                                </ul>
                            </li>
                            <li class="nav-parent">
                                <a>
                                    <i class="fa fa-copy" aria-hidden="true"></i><span>权限管理</span>
                                </a>
                                <ul class="nav nav-children">
                                    <li><a href="${pageContext.request.contextPath}roleCat"><span class="text"> 角色查询</span></a></li>
                                    <li><a href="${pageContext.request.contextPath}roleManager"><span class="text"> 用户角色管理</span></a></li>
                                </ul>
                            </li>
                            <li class="nav-parent">
                                <a>
                                    <i class="fa fa-tasks" aria-hidden="true"></i><span>密码重置</span>
                                </a>
                                <ul class="nav nav-children">
                                    <li><a href="${pageContext.request.contextPath}pwdReset"><span class="text">管理员密码重置</span></a></li>
                                    <li><a href="${pageContext.request.contextPath}userPwdReset"><span class="text"> 用户密码重置</span></a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
                <!-- End Sidebar Menu-->
            </div>
            <!-- Sidebar Footer-->
            <div class="sidebar-footer">
            </div>
            <!-- End Sidebar Footer-->
        </div>
        <!-- End Sidebar -->

        <!-- Main Page -->
        <div class="main sidebar-minified">
            <!-- Page Header -->
            <div class="page-header">
                <div class="pull-left">
                    <ol class="breadcrumb visible-sm visible-md visible-lg">
                        <li class="active"><i class="icon fa fa-home"></i>主页</li>
                    </ol>
                </div>
                <div class="pull-right">
                    <h2>主页</h2>
                </div>
            </div>
            <!-- End Page Header -->
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
                    <div class="owl-carousel" data-plugin-carousel data-plugin-options='{ "autoPlay": 3000, "items": 6, "itemsDesktop": [1199,4], "itemsDesktopSmall": [979,3], "itemsTablet": [768,2], "itemsMobile": [479,1] }'>
                        <div class="item spaced"><img class="img-thumbnail" src="../../img/sky.jpg" alt=""></div>
                        <div class="item spaced"><img class="img-thumbnail" src="../../img/sky1.jpg" alt=""></div>
                        <div class="item spaced"><img class="img-thumbnail" src="../../img/sky2.jpg" alt=""></div>
                        <div class="item spaced"><img class="img-thumbnail" src="../../img/lake.jpg" alt=""></div>
                        <div class="item spaced"><img class="img-thumbnail" src="../../img/lake1.jpg" alt=""></div>
                        <div class="item spaced"><img class="img-thumbnail" src="../../img/building1.jpg" alt=""></div>
                        <div class="item spaced"><img class="img-thumbnail" src="../../img/sky3.jpg" alt=""></div>
                        <div class="item spaced"><img class="img-thumbnail" src="../../img/building2.jpg" alt=""></div>
                        <div class="item spaced"><img class="img-thumbnail" src="../../img/sky.jpg" alt=""></div>
                        <div class="item spaced"><img class="img-thumbnail" src="../../img/sky1.jpg" alt=""></div>
                        <div class="item spaced"><img class="img-thumbnail" src="../../img/sky3.jpg" alt=""></div>
                        <div class="item spaced"><img class="img-thumbnail" src="../../img/lake.jpg" alt=""></div>
                        <div class="item spaced"><img class="img-thumbnail" src="../../img/lake1.jpg" alt=""></div>
                        <div class="item spaced"><img class="img-thumbnail" src="../../img/building1.jpg" alt=""></div>
                        <div class="item spaced"><img class="img-thumbnail" src="../../img/building2.jpg" alt=""></div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-12">
                    <div class="col-sm-6 panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-12 text-left bk-vcenter">
                                    <h6 class="bk-margin-off">欢迎使用</h6>
                                </div>
                            </div>
                        </div>
                        <div class="panel-body">
                            该系统为新生报到注册系统的后台管理功能，
                            随着学校的规模不断扩大，学生数量急剧增加，有关学生的各种信息量也相对的增长。对于这样大量的数据，就需要有学生信息管理系统来提高学生管理工作的效率。而使用这种系统，可以做到信息的规范管理、科学统计和快速的查询，这样就能够减少管理方面的工作量。因为计算机的计算优越性，所以其可以处理复杂的信息。
                            为了紧跟信息时代的脚步，提高学校的工作效率和办学水平，实现现代化大学的运行机制和高水平的管理，体现信息化教学的特色，使计算机成为学校的有力的管理助手。使用计算机来管理新生报到可以避免不必要的资源浪费，更加有利于资源的合理分配，同时也减轻了教务处工作人员的工作负担。
                            “新生报道系统”能将每届新生前来报到时登记其基本信息并将其基本信息录入到数据库中，使用该系统可以实现新生信息的有序存储，使得检索迅速，查找方便、提高了可靠性，可以节省大量的人力。
                        </div>
                    </div>

                    <div class="col-sm-6 panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-12 text-left bk-vcenter">
                                    <h6 class="bk-margin-off">今日日历</h6>
                                </div>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="calendar calendar-small">
                                <div id="calendar"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- End Main Page -->
    </div>
</div><!--/container-->

<!-- Form  -->
<form action="" id="demo-form" class="white-popup-block mfp-hide form-horizontal">
    <div class="row">
        <div class="col-sm-12">
            <h3>资料设置</h3>
            <small>绝不会以任何形式向第三方透漏你的身份信息</small>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-3 control-label">用户名</label>
        <div class="col-sm-9">
            <input type="text" name="account" class="form-control" value="${custom}"  disabled/>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label">昵称</label>
        <div class="col-sm-9">
            <input type="text" name="name" class="form-control" placeholder="请输入你的昵称" required/>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label">性别</label>
        <div class="col-sm-9">
            <div  style="margin:0 0 10px 0">
                <div class="radio-custom radio-inline" style="display:inline-block;">
                    <input type="radio" id="male" name="sex" value="男">
                    <label for="male"> 男</label>
                </div>
                <div class="radio-custom radio-inline" style="display:inline-block">
                    <input type="radio" id="female" name="sex" value="女">
                    <label for="female">女</label>
                </div>
            </div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label">手机号码</label>
        <div class="col-sm-9">
            <input type="text" name="tel" class="form-control" placeholder="输入手机号码" />
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label">常用邮箱</label>
        <div class="col-sm-9">
            <input type="email" name="email" class="form-control" placeholder="输入常用邮箱" />
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label">个人简介</label>
        <div class="col-sm-9">
            <textarea rows="5" name="profile" class="form-control" required></textarea>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-9 col-sm-offset-3">
            <div class="bk-margin-right-15">
                <button type="button" class="btn btn-primary" onclick="saveProfile();">保存</button>
            </div>
        </div>
    </div>
</form>
<!-- End Form -->

<!-- Modal Bootstrap -->
<div class="modal fade" id="modalBootstrap" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">提示信息</h4>
            </div>
            <div class="modal-body">
                <p></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-info" data-dismiss="modal">确定</button>
            </div>
        </div>
    </div>
</div>
<!-- End Modal Bootstrap -->

<div class="clearfix"></div>

<!-- start: JavaScript-->

<!-- Vendor JS-->
<script src="../../vendor/js/jquery.min.js"></script>
<script src="../../vendor/js/jquery-2.1.1.min.js"></script>
<script src="../../vendor/js/jquery-migrate-1.2.1.min.js"></script>
<script src="../../vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="../../vendor/skycons/js/skycons.js"></script>
<script src="../../vendor/js/pace.min.js"></script>


<!-- Plugins JS-->
<script src="../../plugins/moment/js/moment.min.js"></script>
<script src="../../plugins/fullcalendar/js/fullcalendar.js"></script>
<script src="../../plugins/owl-carousel/js/owl.carousel.js"></script>
<script src="../../plugins/magnific-popup/js/magnific-popup.js" ></script>

<!-- Theme JS -->
<script src="../../js/jquery.mmenu.min.js"></script>
<script src="../../js/core.min.js"></script>

<!-- Pages JS -->
<script src="../../js/pages/index.js"></script>
<script src="../../js/pages/ui-carousels.js"></script>

<!-- end: JavaScript-->

</body>

</html>
