<%--
  Created by IntelliJ IDEA.
  User: dl
  Date: 2019/3/22
  Time: 10:46
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
    <!-- Vendor CSS -->
    <link rel="stylesheet" type="text/css" href="../../vendor/bootstrap/css/grid.css">
    <link rel="stylesheet" type="text/css" href="../../plugins/magnific-popup/css/magnific-popup.css">
    <link rel="stylesheet" type="text/css" href="../../plugins/swiper/swiper.css">
    <link rel="stylesheet" type="text/css" href="../../plugins/wow/animate.css">
    <!-- page CSS -->
    <link rel="stylesheet" type="text/css" id="app-stylesheet" href="../../css/main.css">

</head>

<body>
<div class="page-wrap" id="root">

    <!-- header -->
    <header class="header header--fixed">
        <div class="container">
            <div class="header__inner">
                <div class="header__logo"><a>新生报道系统</a></div>
                <div class="header__menu">

                    <!-- onepage-nav -->
                    <nav class="onepage-nav">

                        <!-- onepage-menu -->
                        <ul class="onepage-menu">
                            <li class="current-menu-item"><a href="#id-1">主页</a>
                            </li>
                            <li><a href="#id-2">报到须知</a>
                            </li>
                            <li><a href="#id-3">报到流程</a>
                            </li>
                            <li><a href="#id-4">校园风景</a>
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
        <section class="hero awe-text-center" id="id-1">
            <div class="awe-overlay"></div>
            <div class="hero__wrapper">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 col-lg-8 col-xs-offset-0 col-sm-offset-0 col-md-offset-0 col-lg-offset-2 ">
                            <h1 class="hero__title">新学期 新起点 欢迎新生入学报到
                            </h1>
                            <!--<p class="hero__text">Download niche-specific more <a href="#">free website templates</a> from <a href="#">ThemeWagon</a>. We have a large collection of great products.</p>-->
                            <a class="a-btn btn-first" href="#id-4">校园风景</a><a class="a-btn btn-second" href="#id-3">报到流程</a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- smoky -->
            <div class="smoky" id="smoky-bg">
                <canvas>浏览器不支持!</canvas>
            </div>
            <!-- End / smoky -->

        </section>
        <!-- End / hero -->

        <!-- Section -->
        <section class="awe-section" id="id-2">
            <div class="container container-plus">

                <!-- title -->
                <div class="title">
                    <h2 class="title__title">报到须知
                        <p class="title__text">同学你好，在进行报到的时候请仔细阅读以下相关事项</p>
                    </h2>
                </div>
                <!-- End / title -->


                <!-- tabs__module -->
                <div class="tabs__module" data-options="{}">
                    <ul class="ac-tab__nav clearfix">
                        <li><a href="#tab1"><i class="fa fa-info-circle"></i><span class="ac-tab__title">个人信息完善填写标准</span></a></li>
                        <li><a href="#tab2"><i class="fa fa-bullhorn"></i><span class="ac-tab__title">关于选寝室的通知</span></a></li>
                        <li><a href="#tab3"><i class="fa fa-bell-o"></i><span class="ac-tab__title">新生入学须知</span></a></li>
                        <li><a href="#tab4"><i class="fa fa-exclamation-triangle"></i><span class="ac-tab__title">新生报到安全提示</span></a></li>
                    </ul>
                    <div class="ac-tab__content">

                        <!-- ac-tab__panel -->
                        <div class="ac-tab__panel" id="tab1">
                            <div class="col-lg-4 ">
                                <div><img src="../../img/profile.gif"/></div>
                            </div>
                            <div class="col-lg-8 ">
                                <p class="tab_panel__content">一、每项内容必须填写（除下列部分项要求外），若没有时可注明“无”。<br />二、"籍贯"具体到市、县（区）<br />三、“曾用名”有则写名字，无则写“无”。<br />四、“家庭地址”、“家庭电话”要求学生务必填写详细，若家庭未安装电话，学生可填写父母移动电话。<br />五、“高中毕业学校”在学校前加上省份，如XX省XX中学。<br />六、 “父亲”“母亲”中“职务”及“工作单位”请准确填写（若父母亲无业或农民则在“职务”栏填写“无业”“务农”，“工作单位”不填），“单位邮编”填写父母亲所在单位（所在地）邮编。<br />七、“家庭其他成员”只填写兄弟姐妹详细信息，若无则空白。<br />八、“何时受过何种奖励”、“何时因何受何种处分”只限填写高中或专科时期的相关奖惩内容。</p>
                            </div>
                        </div>
                        <!-- End / ac-tab__panel -->


                        <!-- ac-tab__panel -->
                        <div class="ac-tab__panel" id="tab2">
                            <div class="col-lg-4 ">
                                <div><img src="../../img/room1.jpg"/></div>
                            </div>
                            <div class="col-lg-8 ">
                                <p class="tab_panel__content"> 同学们：<br />&nbsp;&nbsp;&nbsp;&nbsp;选寝室功能已正式开放，同学们可以在系统中选择寝室。</p>
                            </div>
                        </div>
                        <!-- End / ac-tab__panel -->


                        <!-- ac-tab__panel -->
                        <div class="ac-tab__panel" id="tab3">
                            <div class="col-lg-4 ">
                                <div><img src="../../img/goSchool.jpg"/></div>
                            </div>
                            <div class="col-lg-8 ">
                                <p class="tab_panel__content">新生入学分为两个阶段：第一阶段为网上自助报到，请凭身份证号登录系统，按提示完成个人信息补充，办理网上选寝室、费用缴纳、上传相关证件、军训服装选购（自愿）等自助报到流程，如有需要可办理绿色通道登记；第二阶段为新生入校报到。新生直接前往其所在宿舍楼，由驻宿舍迎新志愿者核对证件、确认身份，并进行物品移交，即完成报到。</p>
                            </div>
                        </div>
                        <!-- End / ac-tab__panel -->


                        <!-- ac-tab__panel -->
                        <div class="ac-tab__panel" id="tab4">
                            <div class="col-lg-4 ">
                                <div><img src="../../img/safe.jpg"/></div>
                            </div>
                            <div class="col-lg-8 ">
                                <p class="tab_panel__content">一、来校前，应先了解学校位置、交通工具、乘车路线、是否需要转车、到达时间等事宜，合理安排行程，最好白天到达学校；选择正规车站乘车，注意路途交通安全，遵守交通规则，防止发生交通事故。

                                    <br />二、路途中，应妥善保管《入学通知书》、身份证、银行卡等个人证件以及手机、电脑等贵重物品，不要随身携带大量现金，以免丢失被盗；不要将自己的行李物品交给陌生人(包括不认识的老乡)看管；不要轻易食用陌生人提供的食物、饮料；不要轻易向陌生人透露本人及亲属详细个人信息和家庭住址。陌生人(包括以学校、银行等单位人员名义)主动向你提供服务时，应注意核实其身份，以防上当受骗。

                                    <br />三、到站后，学校在火车站西设有接站点,并未设置其他接站点，请注意确认迎新人员身份，看清学校名称、校区;自行前往的，请选择公交车和正规出租车，切忌不要随便接受主动搭讪的陌生人“帮忙”。过程中有任何问题可以拨打学校招生咨询热线，必要时可向车站工作人员或警察求助。

                                    <br />四、到校后，入学手续应由本人在学校指定地点办理，不要让他人特别是陌生人代办，不要在学校非指定地点办理报到手续、交纳学费。办理报到手续时注意把物品行李放在视线内，或由随行人员看管，防止错拿误拿。用于交纳学费的银行卡要修改初始密码后再使用，设置存折、银行卡等密码时，不要用生日或简单数字，不透露取款、转账密码，发现丢失应立即挂失。遇到电话、短信、网络留言等要求交纳学费、手续费等情况，不要轻易转款、汇款，不要轻信“个人资金账户不安全，需汇款到指定账户”等说辞。

                                    <br />五、入住宿舍后，保管好宿舍钥匙，宿舍无人时锁好门窗，妥善保管贵重物品及行李，钱包、手机等要随身携带，宿舍钥匙丢失要及时更换锁芯；宿舍内不要存放现金，存折、银行卡与身份证分开存放；不贪图小便宜接受各种上门推销，谨防上当受骗。注意防火安全，不在宿舍内使用劣质插座、大功率电器、酒精炉、煤气灶等，不私接电源电线，不存放易燃易爆品，不在宿舍使用明火，离开宿舍时要切断电器电源。

                                    <br />六、报道手续办理完毕，应尽快熟悉学校及周边环境,牢记学校地址及所在学院联系方式，及时告知父母家人情况，不在校外留宿。女生外出时尽量结伴而行，如无特殊情况夜晚尽量不要外出、不要做偏僻路段、人员稀少地方逗留，避免发生意外。

                                    <br />七、校内遇到紧急情况，可拨打学校保卫处24小时值班报警电话求助。</p>
                            </div>
                        </div>
                        <!-- End / ac-tab__panel -->

                    </div>
                </div>
                <!-- End / tabs__module -->

            </div>
        </section>
        <!-- End / Section -->

        <!-- Section -->
        <section class="awe-section" id="id-3">
            <div class="container">

                <!-- title -->
                <div class="title">
                    <h2 class="title__title"><span class='first'>怎样报到?</span><br />报到流程
                        <p class="title__text"></p>
                    </h2>
                </div>
                <!-- End / title -->

                <div class="col-lg-6">

                    <!-- service -->
                    <a href="${pageContext.request.contextPath}info">
                        <div class="service wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.2s" data-wow-offset="20" data-wow-iteration="1">
                            <div class="service__icon"><i class="fa fa-exclamation"></i></div>
                            <h3 class="service__title">完善个人信息</h3>
                            <p class="service__text">填写自己的个人信息，例如姓名、年龄、性别等。</p>
                        </div>
                    </a>
                    <!-- End / service -->

                </div>
                <div class="col-lg-6">

                    <!-- service -->
                    <a href="${pageContext.request.contextPath}pay">
                        <div class="service wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.4s" data-wow-offset="20" data-wow-iteration="1">
                            <div class="service__icon"><i class="fa fa-cny"></i></div>
                            <h3 class="service__title">缴费缴纳</h3>
                            <p class="service__text">查看自己的缴费情况，并进行交费</p>
                        </div>
                    </a>
                    <!-- End / service -->

                </div>
                <div class="col-lg-6">

                    <!-- service -->
                    <a href="${pageContext.request.contextPath}green">
                        <div class="service wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.6000000000000001s" data-wow-offset="20" data-wow-iteration="1">
                            <div class="service__icon"><i class="fa fa-play-circle"></i></div>
                            <h3 class="service__title">绿色通道</h3>
                            <p class="service__text">申请使用绿色通道，提交材料验证通过后，不用在缴纳学费</p>
                        </div>
                    </a>
                    <!-- End / service -->

                </div>
                <div class="col-lg-6">

                    <!-- service -->
                    <a href="${pageContext.request.contextPath}room">
                        <div class="service wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.8s" data-wow-offset="20" data-wow-iteration="1">
                            <div class="service__icon"><i class="fa fa-search"></i></div>
                            <h3 class="service__title">寝室选择</h3>
                            <p class="service__text">查看寝室选取情况，并进行寝室的选择</p>
                        </div>
                    </a>
                    <!-- End / service -->

                </div>
            </div>
        </section>
        <!-- End / Section -->


        <!-- Section -->
        <section class="awe-section" id="id-4">
            <div class="container">
                <div class="row">

                    <!-- title -->
                    <div class="title">
                        <h2 class="title__title">校园风景
                            <p class="title__text">校园风景美如画，同学们将在这里度过一个美好的大学时光</p>
                        </h2>
                    </div>
                    <!-- End / title -->

                </div>
                <div class="grid-css grid-css--grid" data-col-lg="3" data-col-md="2" data-col-sm="2" data-col-xs="1" data-gap="30">
                    <div class="filter">
                        <ul class="filter__list">
                            <li><a href="#" data-filter="*">全部</a></li>
                            <li><a href="#" data-filter=".cat1">湖水</a></li>
                            <li><a href="#" data-filter=".cat2">高楼</a></li>
                            <li><a href="#" data-filter=".cat3">蓝天</a></li>
                        </ul>
                    </div>
                    <div class="grid__inner">
                        <div class="grid-sizer"></div>
                        <div class="grid-item normal cat1">
                            <div class="grid-item__inner">
                                <div class="grid-item__content-wrapper">

                                    <!-- portfolio -->
                                    <div class="portfolio"><img style="height: 100%" src="../../img/lake.jpg"/>

                                    </div>
                                    <!-- End / portfolio -->

                                </div>
                            </div>
                        </div>
                        <div class="grid-item normal cat2">
                            <div class="grid-item__inner">
                                <div class="grid-item__content-wrapper">

                                    <!-- portfolio -->
                                    <div class="portfolio"><img style="height: 100%" src="../../img/building1.jpg"/>

                                    </div>
                                    <!-- End / portfolio -->

                                </div>
                            </div>
                        </div>
                        <div class="grid-item normal cat2">
                            <div class="grid-item__inner">
                                <div class="grid-item__content-wrapper">

                                    <!-- portfolio -->
                                    <div class="portfolio"><img style="height: 100%" src="../../img/building2.jpg"/>

                                    </div>
                                    <!-- End / portfolio -->

                                </div>
                            </div>
                        </div>
                        <div class="grid-item normal cat1">
                            <div class="grid-item__inner">
                                <div class="grid-item__content-wrapper">

                                    <!-- portfolio -->
                                    <div class="portfolio"><img style="height: 100%" src="../../img/lake1.jpg"/>

                                    </div>
                                    <!-- End / portfolio -->

                                </div>
                            </div>
                        </div>
                        <div class="grid-item normal cat3">
                            <div class="grid-item__inner">
                                <div class="grid-item__content-wrapper">

                                    <!-- portfolio -->
                                    <div class="portfolio"><img style="height: 100%" src="../../img/sky1.jpg"/>
                                    </div><!-- End / portfolio -->

                                </div>
                            </div>
                        </div>
                        <div class="grid-item normal cat3">
                            <div class="grid-item__inner">
                                <div class="grid-item__content-wrapper">

                                    <!-- portfolio -->
                                    <div class="portfolio"><img style="height: 100%" src="../../img/sky.jpg"/>
                                    </div>
                                    <!-- End / portfolio -->

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End / Section -->
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
                    </a>
                    <!-- End / social-icon -->


                    <!-- social-icon -->
                    <a class="social-icon" href="#"><i class="social-icon__icon fa fa-twitter"></i>
                    </a>
                    <!-- End / social-icon -->


                    <!-- social-icon -->
                    <a class="social-icon" href="#"><i class="social-icon__icon fa fa-google-plus"></i>
                    </a>
                    <!-- End / social-icon -->


                    <!-- social-icon -->
                    <a class="social-icon" href="#"><i class="social-icon__icon fa fa-instagram"></i>
                    </a>
                    <!-- End / social-icon -->

                </div>
                <p class="footer__copy">2019 &copy; 欢迎使用新生注册报到管理系统</p>
            </div>
        </div>
    </div><!-- End / footer -->

</div>


<!-- start: JavaScript-->

<!-- Vendor JS-->
<script type="text/javascript" src="../../vendor/js/jquery.min.js"></script>
<script type="text/javascript" src="../../plugins/imagesloaded/imagesloaded.pkgd.js"></script>
<script type="text/javascript" src="../../plugins/isotope-layout/isotope.pkgd.js"></script>
<script type="text/javascript" src="../../vendor/jquery-one-page/jquery.nav.min.js"></script>
<script type="text/javascript" src="../../vendor/jquery.easing/jquery.easing.min.js"></script>
<script type="text/javascript" src="../../vendor/jquery.matchHeight/jquery.matchHeight.min.js"></script>
<script type="text/javascript" src="../../plugins/magnific-popup/js/magnific-popup.js"></script>
<script type="text/javascript" src="../../plugins/masonry-layout/masonry.pkgd.js"></script>
<script type="text/javascript" src="../../plugins/swiper/swiper.jquery.js"></script>
<script type="text/javascript" src="../../plugins/menu/menu.js"></script>
<script type="text/javascript" src="../../vendor/jquery.countTo/jquery.countTo.min.js"></script>
<script type="text/javascript" src="../../vendor/jquery.waypoints/jquery.waypoints.min.js"></script>
<script type="text/javascript" src="../../plugins/tabs/awe-tabs.js"></script>
<script type="text/javascript" src="../../plugins/wow/wow.js"></script>
<script type="text/javascript" src="../../vendor/jquery.appear/jquery.appear.js"></script>
<script type="text/javascript" src="../../plugins/waterpipe/waterpipe.js"></script>

<!-- page Script -->
<script type="text/javascript" src="../../js/main.js"></script>

<!-- end: JavaScript-->


</body>
</html>
