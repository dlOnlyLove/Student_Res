
(function( $ ) {

    /*
    Isotope: Sort Thumbnails
    */
    $("[data-sort-source]").each(function() {

        var source = $(this);
        var destination = $("[data-sort-destination][data-sort-id=" + $(this).attr("data-sort-id") + "]");

        if(destination.get(0)) {

            $(window).load(function() {

                destination.isotope({
                    itemSelector: ".isotope-item",
                    layoutMode: 'fitRows'
                });

                $(window).on('sidebar-left-toggle inner-menu-toggle', function() {
                    destination.isotope();
                });

                source.find("a[data-option-value]").click(function(e) {

                    e.preventDefault();

                    var $this = $(this),
                        filter = $this.attr("data-option-value");

                    source.find(".active").removeClass("active");
                    $this.closest("li").addClass("active");

                    destination.isotope({
                        filter: filter
                    });

                    if(window.location.hash != "" || filter.replace(".","") != "*") {
                        window.location.hash = filter.replace(".","");
                    }

                    return false;

                });

                $(window).bind("hashchange", function(e) {

                    var hashFilter = "." + location.hash.replace("#",""),
                        hash = (hashFilter == "." || hashFilter == ".*" ? "*" : hashFilter);

                    source.find(".active").removeClass("active");
                    source.find("[data-option-value='" + hash + "']").closest("li").addClass("active");

                    destination.isotope({
                        filter: hash
                    });

                });

                var hashFilter = "." + (location.hash.replace("#","") || "*");
                var initFilterEl = source.find("a[data-option-value='" + hashFilter + "']");

                if(initFilterEl.get(0)) {
                    source.find("[data-option-value='" + hashFilter + "']").click();
                } else {
                    source.find(".active a").click();
                }

            });

        }

    });

    $(".mg-thumb-options").on('click', function () {
        var IDNum = $("#IDNum").val();
        var rno = $(this).parent().parent().find("h5").html();
        var numberInfo = $(this).parent().parent().find("small.bk-fg-primary").html();
        var currentSize = numberInfo.split("/")[0];
        var roomSize = numberInfo.split("/")[1];
        if(currentSize + 1 > roomSize) {
            alert("该寝室已满,请选择其他寝室！");
            return false;
        }

        // alert(currentSize);
        $.ajax({
            url: "selectRoomAction",
            type: "POST",
            data: {
                "rno": rno,
                "IDNum": IDNum,
                "currentSize": currentSize,
                "roomSize": roomSize
            },
            dataType: "json",
            success: function (res) {
                alert(res.msg);
                location.reload();
            },
            error: function () {
                alert("服务器错误！");
            }

        });
    });

}(jQuery));
