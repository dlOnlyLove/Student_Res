// File-Encoding UTF-8




//已报到的男女数
(function () {
    var chartData = { // 初始化
        "xScale": "ordinal",
        "yScale": "linear",
        "main": [
            {
                "className": ".pizza",
                "data": []
            }
        ]
    };

    $.ajax({ // 请求数据
        url: 'reportSex',
        type: 'POST',
        dataType: 'json',
        success: function(mydata) {
            function result(x, y) {
                this.x = x;
                this.y = y;
            }
            chartData.main[0].data[0] = new result("男", mydata.male);
            chartData.main[0].data[1] = new result("女", mydata.female);
            new xChart('bar', chartData, '#xchart-bars');
        },
        error: function(mydata) {
            alert("已报到人数为空！");
        }
    });
}());


//全校报到人数统计
(function () {
    var chartData = {
        "xScale": "ordinal",
        "yScale": "linear",
        "main": [
            {
                "className": ".pizza",
                "data": []
            }
        ]
    };

    $.ajax({ // 请求数据
        url: 'reportAll',
        type: 'POST',
        dataType: 'json',
        success: function(mydata) {
            function result(x, y) {
                this.x = x;
                this.y = y;
            }
            chartData.main[0].data[0] = new result("已报到", mydata.report);
            chartData.main[0].data[1] = new result("未报到", mydata.noreport);
            new xChart('bar', chartData, '#xchart-bars1');
        },
        error: function() {
            alert("人数为空！");
        }
    });
}());
