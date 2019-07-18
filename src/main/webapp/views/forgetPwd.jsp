<%--
  Created by IntelliJ IDEA.
  User: dl
  Date: 2019/5/29
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>忘记密码</title>
    <link rel="stylesheet" href="../vendor/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../css/forgetPwd.css"/>
    <link rel="stylesheet" type="text/css" href="../css/body.css"/>
</head>
<body>
<div  class="container">
    <section id="content">
        <div class="header bk-margin-bottom-20 text-center">
            <img src="../img/logo.png" class="img-responsive" style="width: 68%; height: 15%; display: unset;" alt="" />
        </div>
        <form  class="form-horizontal"  id="sendMeForm">
            <h1>忘记密码</h1>

            <div class="form-group">
                <label class="col-sm-3 control-label">帐号：</label>
                <div class="col-sm-9">
                    <input type="text" placeholder="账户"  required name="account" id="account" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">手机号：</label>
                <div class="col-sm-9">
                    <input type="text" placeholder="手机号" required name="tel" id="tel" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">验证码：</label>
                <div class="col-sm-9">
                    <input type="text" placeholder="验证码" required name="code" id="code" />
                    <input class="btn btn-primary" id="sendBtn" name="sendBtn" value="发送验证码"  />
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">新密码：</label>
                <div class="col-sm-9">
                    <input type="password" placeholder="新密码" required="" name="password" id="password" />
                </div>
            </div>

            <div>
                <span>&nbsp;</span>
            </div>

            <div>
                <!-- <input type="submit" value="Log in" /> -->
                <input  type="button" value="修改" id="submitInfo"/>
            </div>
        </form><!-- form -->
    </section><!-- content -->

</div>
<!-- container -->


<br><br><br><br>
<div style="text-align:center;">
</div>
<!-- Vendors javaScript -->
<script type="text/javascript" src="../vendor/bootstrap/css/bootstrap.min.css"></script>
<script type="text/javascript" src="../vendor/js/jquery-3.2.1.js"></script>



<!-- Page javaScript -->
<script src="../js/pages/forgetPwd.js" ></script>
</body>
</html>
