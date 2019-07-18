(function ( $ ) {

    $("#form button").on('click',function () {
        var IDNum = $("#form input[name=IDNum]").val();
        var costumes = $("#form select").val();
        var loan = $("#form input[name=loan]").val();
        var file = $("#form input[type=file]")[0].files[0];
        var money = 4500 + parseInt(costumes);

        var formData = new FormData();
        formData.append("proofMaterial", file);
        formData.append("loan", loan);
        formData.append("costumes", costumes);
        formData.append("IDNum", IDNum);
        formData.append("money", money);
        $.ajax({
            url:'greenAction',
            type:'post',
            data: formData,
            contentType: false,
            processData: false,
            success:function(res){
                if(res.msg == "申请已提交！") {
                    $("#form input[name=green]").val("待审核");
                    $("#form button").attr("disabled", true);
                    alert(res.msg);
                } else {
                    alert(res.msg);
                }
            },
            error: function () {
                alert("服务器内部错误！");
            }
        });
    });

}(jQuery));