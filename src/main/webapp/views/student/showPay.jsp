<%--
  Created by IntelliJ IDEA.
  User: dl
  Date: 2019/5/24
  Time: 14:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>支付结果</title>
</head>
<body>
${msg}
<p id="sp"></p>
<script>
    onload=function(){
        setInterval(go, 1000);
    };
    var x=3; //利用了全局变量来执行
    function go(){
        x--;
        if(x>0){
            document.getElementById("sp").innerHTML=x; //每次设置的x的值都不一样了。
        }else{
            location.href='${pageContext.request.contextPath}confirm';
        }
    }
</script>
</body>
</html>
