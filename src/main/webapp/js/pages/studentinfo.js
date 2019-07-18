(function ( $ ) {

    $("#infoForm input[type=radio][name=sex][value="+ globalSex + "]").attr("checked",true);
    $("#saveProfile").on('click', function () {
        function personInfo(name, IDNum, tel, sex, birthday, age) {
            this.name = name;
            this.IDNum = IDNum;
            this.tel = tel;
            this.sex = sex;
            this.birthday = birthday;
            this.age = age;
        }

        var name = $("#infoForm input[name=name]").val();
        var IDNum = $("#infoForm input[name=IDNum]").val();
        var tel = $("#infoForm input[name=tel]").val();
        var sex= $("#infoForm input[name=sex]:checked").val();
        var birthday = $("#infoForm input[name=birthday]").val();
        var age = $("#infoForm input[name=age]").val();

        var form = new personInfo(name, IDNum, tel, sex, birthday, age);

        $.ajax({
            url: "updateInfo",
            type: 'POST',
            data: {
                "name": form.name,
                "IDNum": form.IDNum,
                "tel": form.tel,
                "sex": form.sex,
                "birthday": form.birthday,
                "age": form.age
            },
            dataType: 'json',
            success: function (res) {
                alert(res.msg);
            },
            error: function () {
                alert("服务器错误！");
            }
        });
    });

    $("#resetPwdForm input[name=name]")

    $("#resetPwd").on('click', function () {
        var newPwd = $("#resetPwdForm input[name=newPwd]").val();
        var IDNum = $("#infoForm input[name=IDNum]").val();

        $.ajax({
            url: "updatePwd",
            type: 'POST',
            data: {
                "IDNum": IDNum,
                "password": newPwd
            },
            dataType: 'json',
            success: function (res) {
                alert(res.msg);
            },
            error: function () {
                alert("服务器错误！");
            }
        });
    });



}(jQuery));

(function ( $ ) {

    $("#infoForm input[type=date]").val(globalBirthday);

    $("#infoForm textarea").text(globalProfile);
    if(globalSex === "男") {
        $("#infoForm input[type=radio][name=sex][value=男]").attr("checked",true);
    } else {
        $("#infoForm input[type=radio][name=sex][value=女]").attr("checked",true);
    }

}(jQuery));
