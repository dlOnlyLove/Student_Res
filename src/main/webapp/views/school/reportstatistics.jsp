<%--
  Created by IntelliJ IDEA.
  User: dl
  Date: 2019/5/3
  Time: 12:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <!-- Basic -->
    <meta charset="UTF-8" />

    <title>报道统计</title>

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
    <link href="../../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" />

    <!-- Plugins CSS-->
    <link href="../../plugins/bootkit/css/bootkit.css" rel="stylesheet" />
    <link href="../../plugins/xcharts/css/xcharts.min.css" rel="stylesheet" />

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

        <!-- Navbar Right -->
        <div class="navbar-right">
            <!-- Userbox -->
            <div class="userbox">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <figure class="profile-picture hidden-xs">
                        <img src="../../img/avatar1.jpg" class="img-circle" alt="" />
                    </figure>
                    <div class="profile-info">
                        <span class="name">教务处管理员</span>
                        <span class="role"><i class="fa fa-circle bk-fg-success"></i> ${custom }</span>
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
                            <li class="active nav-parent nav-expanded">
                                <a>
                                    <i class="fa fa-laptop" aria-hidden="true"></i><span>学生信息管理</span>
                                </a>
                                <ul class="nav nav-children">
                                    <li><a href="${pageContext.request.contextPath}schoolinandout"><span class="text">信息导入导出</span></a></li>
                                    <li><a href="${pageContext.request.contextPath}reportStatistics"><span class="text">报到统计</span></a></li>
                                </ul>
                            </li>
                            <li class="nav-parent">
                                <a>
                                    <i class="fa fa-tasks" aria-hidden="true"></i><span>住宿管理</span>
                                </a>
                                <ul class="nav nav-children">
                                    <li><a href="${pageContext.request.contextPath}roomIndex"><span class="text">寝室管理</span></a></li>
                                </ul>
                            </li>

                            <li class="nav-parent">
                                <a>
                                    <i class="fa fa-tasks" aria-hidden="true"></i><span>财务管理</span>
                                </a>
                                <ul class="nav nav-children">
                                    <li><a href="${pageContext.request.contextPath}payIndex"><span class="text">交费查询</span></a></li>
                                    <li><a href="${pageContext.request.contextPath}greenIndex"><span class="text">绿色通道审核</span></a></li>
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
                        <li><a><i class="icon fa fa-home"></i>主页</a></li>
                        <li class="active"><i class="fa fa-laptop"></i>学生信息管理</li>
                        <li class="active"><i class="fa fa-laptop"></i>报到统计</li>
                    </ol>
                </div>
                <div class="pull-right">
                    <h2>报到统计</h2>
                </div>
            </div>
            <!-- End Page Header -->

            <div class="row">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="panel panel-default bk-bg-white">
                            <div class="panel-heading bk-bg-white">
                                <h6><i class="fa fa-retweet red"></i>已报到男女比例</h6>
                            </div>
                            <div class="panel-body">
                                <figure class="demo" id="xchart-bars" style="height: 300px"></figure>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <div class="panel panel-default bk-bg-white">
                            <div class="panel-heading bk-bg-white">
                                <h6><i class="fa fa-retweet red"></i>全校报到比例</h6>
                            </div>
                            <div class="panel-body">
                                <figure class="demo" id="xchart-bars1" style="height: 300px"></figure>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- End Main Page -->

    </div>
</div><!--/container-->


<div class="clearfix"></div>


<!-- start: JavaScript-->

<!-- Vendor JS-->
<script src="../../vendor/js/jquery.min.js"></script>
<script src="../../vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Plugins JS-->
<script src="../../plugins/d3/js/d3.min.js"></script>
<script src="../../plugins/xcharts/js/xcharts.min.js"></script>

<!-- Theme JS -->
<script src="../../js/core.min.js"></script>

<!-- Pages JS -->
<script src="../../js/pages/reportstatistics.js"></script>

<!-- end: JavaScript-->

</body>

</html>