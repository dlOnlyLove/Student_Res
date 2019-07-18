var InterValObj; // timer变量，控制时间
var count = 30; // 间隔函数，1秒执行
var curCount; // 当前剩余秒数

function sendMessage(){
    curCount = count;
    var codeBtn = $("#sendBtn");
    codeBtn.attr("disabled", "true");
    codeBtn.val(curCount + "秒后可重新发送");
    InterValObj = window.setInterval(SetRemainTime, 1000); // 启动计时器，1秒执行一次请求后台发送验证码
}

//timer处理函数
function SetRemainTime() {
    var codeBtn = $("#sendBtn");
    if (curCount == 0) {
        window.clearInterval(InterValObj); // 停止计时器
        codeBtn.removeAttr("disabled"); // 启用按钮
        codeBtn.val("重新发送验证码");
    }
    else {
        curCount--;
        codeBtn.val(curCount + "秒后可重新发送");
    }
}

$("#sendBtn").on('click', function () {
    var tel = $("#tel").val();
    var account = $("#account").val();
    if(tel == "") {
        alert("手机号不能为空！");
        return false;
    } else if (account == "") {
        alert("用户名不能为空！");
        return false;
    } else {
        $.ajax({
            url : "sendMe",
            type : "POST",
            data : {
                "account" : account,
                "tel" : tel
            },
            dataType : "json",
            success : function(res){
                alert(res.msg);
                if(res.msg == "发送成功") {
                    sendMessage();
                }
            },
            error : function () {
                alert("服务器内部错误");
            }
        });
    }
});
$("#submitInfo").on('click', function () {
    var tel = $("#tel").val();
    var account = $("#account").val();
    var code = $("#code").val();
    var password = $("#password").val();

    if(account == "") {
        alert("用户名不能为空！");
        return false;
    } else if (tel == "") {
        alert("手机号码不能为空！");
        return false;
    } else if (code == "") {
        alert("验证码不能为空！");
        return false;
    } else if (password == "") {
        alert("密码不能为空！");
        return false;
    } else {
        $.ajax({
            url : "comparecode",
            type : "POST",
            data : {
                "account" : account,
                "code": code,
                "password": password
            },
            dataType : "json",
            success : function(res){
                alert(res.msg + "请登录！");
                window.location.href = "login";
            },
            error : function () {
                alert("服务器内部错误");
            }
        });
    }

});
