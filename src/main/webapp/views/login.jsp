<%--
  Created by IntelliJ IDEA.
  User: dl
  Date: 2019/3/21
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>系统登录</title>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link rel="stylesheet" type="text/css" href="css/body.css"/>
</head>
<body>
<div  class="container">
    <section id="content">
        <div class="header bk-margin-bottom-20 text-center">
            <img src="../img/logo.png" class="img-responsive" style="width: 68%; height: 15%" alt="" />
        </div>
        <form action="login" method="post">
            <h1>用户登录</h1>

            <div>
                <input type="text" placeholder="请输入身份证号"  required=""  name="username" id="username" />
            </div>

            <div>
                <input type="password" placeholder="密码" required="" name="password" id="password" />
            </div>

            <div>
                <span>&nbsp;</span>
            </div>
            <div  style="margin:0 0 10px 0">
                <div class="radio-custom radio-inline" style="display:inline-block;">
                    <input type="radio" id="inline-radio1" name="role" value="admin">
                    <label for="inline-radio1"> 系统管理员</label>
                </div>
                <div class="radio-custom radio-inline" style="display:inline-block">
                    <input type="radio" id="inline-radio2" name="role" value="school">
                    <label for="inline-radio2">教务处管理员</label>
                </div>
                <div class="radio-custom radio-inline" style="display:inline-block;">
                    <input type="radio" id="inline-radio3" name="role" value="student">
                    <label for="inline-radio3"> 学生登录</label>
                </div>
            </div>
            <div>
                <!-- <input type="submit" value="Log in" /> -->
                <input type="submit" value="登录"/>
            </div>
        </form><!-- form -->
        <div class="button">
            <span><a href="forgetPwd">忘记密码?</a></span>
        </div> <!-- button -->
    </section><!-- content -->

</div>
<!-- container -->


<br><br><br><br>
<div style="text-align:center;">
</div>
<script>
    window.onload = function (ev) {
        if(!${empty errorMsg}) {
            alert("${errorMsg}");
        }
    }

</script>
</body>
</html>
