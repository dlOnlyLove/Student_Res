<%--
  Created by IntelliJ IDEA.
  User: dl
  Date: 2019/5/2
  Time: 9:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <!-- Basic -->
    <meta charset="UTF-8" />

    <title>Dashboard | Fire - Admin Template</title>

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
    <link href="../../plugins/select2/select2.css" rel="stylesheet" />
    <link href="../../plugins/bootkit/css/bootkit.css" rel="stylesheet" />
    <link href="../../plugins/jquery-datatables-bs3/css/datatables.css" rel="stylesheet" />


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
                        <span class="role"><i class="fa fa-circle bk-fg-success"></i> ${custom}</span>
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
                                    <i class="fa fa-copy" aria-hidden="true"></i><span>院系管理</span>
                                </a>
                                <ul class="nav nav-children">
                                    <li><a href="${pageContext.request.contextPath}page-profile.html"><span class="text">报到确认</span></a></li>
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
        <div class="main">
            <!-- Page Header -->
            <div class="page-header">
                <div class="pull-left">
                    <ol class="breadcrumb visible-sm visible-md visible-lg">
                        <li><a><i class="icon fa fa-home"></i>主页</a></li>
                        <li class="active"><i class="fa fa-laptop"></i>学生信息管理</li>
                        <li class="active"><i class="fa fa-laptop"></i>信息导入导出</li>
                    </ol>
                </div>
                <div class="pull-right">
                    <h2>信息导入导出</h2>
                </div>
            </div>
            <!-- End Page Header -->
            <div class="row">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="panel panel-default bk-bg-white">
                            <div class="panel-heading bk-bg-white">
                                <h6><i class="fa fa-table red"></i><span class="break"></span>重复信息</h6>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="bk-margin-bottom-10">
                                            <a href="${pageContext.request.contextPath }schoolinandout"><button class="btn btn-info">返回</button></a>
                                        </div>
                                    </div>
                                </div>
                                <table class="table table-bordered table-striped" id="datatable-default">
                                    <thead>
                                    <tr>
                                        <th>身份证</th>
                                        <th>姓名</th>
                                        <th>性别</th>
                                        <th>年龄</th>
                                        <th>电话</th>
                                        <th>生日</th>
                                        <th>专业</th>
                                        <th>寝室</th>
                                        <th>报到情况</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${errorStudents }" var="student">
                                        <tr>
                                            <td>${student.IDNum}</td>
                                            <td>${student.name}</td>
                                            <td>${student.sex}</td>
                                            <td>${student.age}</td>
                                            <td>${student.tel}</td>
                                            <td>${student.birthday}</td>
                                            <td>${student.major}</td>
                                            <td>${student.rno}</td>
                                            <td>${student.registration}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
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
<script src="../../vendor/js/jquery-2.1.1.min.js"></script>
<script src="../../vendor/js/jquery-migrate-1.2.1.min.js"></script>
<script src="../../vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Plugins JS-->
<script src="../../plugins/moment/js/moment.min.js"></script>
<script src="../../plugins/select2/select2.js"></script>
<script src="../../plugins/jquery-datatables/media/js/jquery.dataTables.js"></script>
<script src="../../plugins/jquery-datatables-bs3/js/datatables.js"></script>

<!-- Theme JS -->
<script src="../../js/jquery.mmenu.min.js"></script>
<script src="../../js/core.min.js"></script>

<!-- Pages JS -->
<script src="../../js/pages/showstudent.js"></script>

<!-- end: JavaScript-->

</body>

</html>


