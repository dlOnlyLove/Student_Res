<%--
  Created by IntelliJ IDEA.
  User: dl
  Date: 2019/4/21
  Time: 22:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>密码重置</title>

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
    <link href="../../plugins/magnific-popup/css/magnific-popup.css" rel="stylesheet" />

    <!-- Page CSS -->
    <link href="../../css/style-manager.css" rel="stylesheet" />
    <link href="../../css/add-ons.min.css" rel="stylesheet" />
    <link href="../../css/pages/adminpwdreset.css" rel="stylesheet" />

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
                            <li class="nav-parent">
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
                            <li class="nav-parent nav-expanded active">
                                <a>
                                    <i class="fa fa-tasks" aria-hidden="true"></i><span>密码重置</span>
                                </a>
                                <ul class="nav nav-children">
                                    <li><a href="${pageContext.request.contextPath}pwdReset"><span class="text"> 管理员密码重置</span></a></li>
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
                        <li><a><i class="icon fa fa-home"></i>主页</a></li>
                        <li><a><i class="icon fa fa-home"></i>密码重置</a></li>
                        <li class="active"><i class="fa fa-laptop"></i>管理员密码重置</li>
                    </ol>
                </div>
                <div class="pull-right">
                    <h2>管理员密码重置</h2>
                </div>
            </div>
            <!-- End Page Header -->
            <div class="row margin">
                <div class="row">
                    <!-- Form -->
                    <div class="col-lg-7 col-md-7 col-sm-7">
                        <div class="panel">
                            <div class="panel-body">
                                <form action="#" id="resetPwdForm" class="form-horizontal" method="POST">
                                    <div class="bk-bg-white bk-padding-top-10 bk-padding-bottom-10">
                                        <fieldset>
                                            <div class="form-group">
                                                <label for="oldPwd">旧密码</label>
                                                <input type="password" name="oldPwd" class="form-control" id="oldPwd" placeholder="旧密码" required/>
                                            </div>
                                            <div class="form-group">
                                                <label for="newPwd">新密码</label>
                                                <input type="password" name="newPwd" class="form-control" id="newPwd" placeholder="新密码" required/>
                                            </div>
                                            <div class="form-group">
                                                <label for="confirmPwd">确认新密码</label>
                                                <input type="password" name="confirmPwd" class="form-control" id="confirmPwd" placeholder="再次输入密码" required/>
                                            </div>
                                        </fieldset>
                                        <div class="bk-bg-white">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <button type="button" id="resetPwdAction" class="btn btn-primary">确认</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- End Form -->
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
                <button  onclick="saveProfile()" type="button" class="btn btn-primary">保存</button>
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

<!-- Plugins JS-->
<script src="../../plugins/magnific-popup/js/magnific-popup.js" ></script>

<!-- Theme JS -->
<script src="../../js/jquery.mmenu.min.js"></script>
<script src="../../js/core.min.js"></script>

<!-- Pages JS -->
<script src="../../js/pages/adminpwdreset.js"></script>

<!-- end: JavaScript-->

</body>

</html>
