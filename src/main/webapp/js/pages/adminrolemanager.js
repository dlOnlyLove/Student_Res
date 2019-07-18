// file encoding UTF-8
/*========== 弹框开始 ==========*/
(function( $ ) {

    'use strict';

    /*
    Form
    */
    $('.popup-with-form').magnificPopup({
        type: 'inline',
        preloader: false,
        focus: '#name',

        // When elemened is focused, some mobile browsers in some cases zoom in
        // It looks not nice, so we disable it:
        callbacks: {
            beforeOpen: function() {
                if($(window).width() < 700) {
                    this.st.focus = false;
                } else {
                    this.st.focus = '#name';
                }
            }
        }
    });

    $(".profile").on('click', function(){
        var account = $("#demo-form input[name=account]").val();
        $.ajax({
            url: 'profileEdit',
            async: false,
            type: 'POST',
            data: {
                "account": account
            },
            dataType: 'json',
            success: function(data) {
                $("#demo-form input[name=email]").val(data.email);
                $("#demo-form input[name=name]").val(data.name);
                $("#demo-form input[name=tel]").val(data.tel);
                $("#demo-form textarea[name=profile]").val(data.profile);
                $("#demo-form input[type=radio][name=sex][value="+ data.sex + "]").attr("checked",true);
            },
            error: function(data) {
                alert("error");
            }
        });
    });

}).apply( this, [ jQuery ]);
/*========== 弹框结束 ==========*/


/*========== JQuery datatable Start ==========*/
(function($) {

    'use strict';

    // we overwrite initialize of all datatables here
    // because we want to use select2, give search input a bootstrap look
    // keep in mind if you overwrite this fnInitComplete somewhere,
    // you should run the code inside this function to keep functionality.
    //
    // there's no better way to do this at this time :(
    if ( $.isFunction( $.fn[ 'dataTable' ] ) ) {

        $.extend(true, $.fn.dataTable.defaults, {
            sDom: "<'row datatables-header form-inline'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>r><'table-responsive't><'row datatables-footer'<'col-sm-12 col-md-6'i><'col-sm-12 col-md-6'p>>",
            oLanguage: {
                sLengthMenu: '_MENU_ 条记录每页',
                sProcessing: '<i class="fa fa-spinner fa-spin"></i> Loading',
                sEmptyTable: "表中没有数据!",
                sInfo: "当前 _START_ 到 _END_ 条数据!",
                sInfoEmpty: "Showing 0 to 0 of 0 entries",
                sInfoFiltered: "(filtered from _MAX_ total entries)",
                sLoadingRecords: "Loading...",
                sZeroRecords: "No matching records found"
            },
            fnInitComplete: function( settings, json ) {
                // select 2
                if ( $.isFunction( $.fn[ 'select2' ] ) ) {
                    $('.dataTables_length select', settings.nTableWrapper).select2({
                        minimumResultsForSearch: -1
                    });
                }

                var options = $( 'table', settings.nTableWrapper ).data( 'plugin-options' ) || {};

                // search
                var $search = $('.dataTables_filter input', settings.nTableWrapper);

                $search
                    .attr({
                        placeholder: typeof options.searchPlaceholder !== 'undefined' ? options.searchPlaceholder : '查找'
                    })
                    .addClass('form-control');

                if ( $.isFunction( $.fn.placeholder ) ) {
                    $search.placeholder();
                }
            }
        });

    }

}).apply( this, [ jQuery ]);

// Datatable - default Start
(function( $ ) {

    'use strict';

    var datatableInit = function() {

        $('#datatable-default').dataTable();

    };

    $(function() {
        datatableInit();
    });

}).apply( this, [ jQuery ]);
// Datatable - default End

/*========== JQuery datatable End ==========*/


/*========== 开关点击开始 ==========*/
(function( $ ) {
    $(".switch-input").on('change',function(){
        var account = $(this).parent().parent().parent().find("td").eq(0).text();
        var roleName = $(this).parent().parent().parent().find("td").eq(3).text();
        var roleState;
        if($(this).is(':checked')) {
            roleState = 1;
        } else {
            roleState = 0;
        }
        if(roleName == "school") {

            $.ajax({
                url: 'changeState',
                async: false,
                type: 'POST',
                data: {
                    "account" : account,
                    "roleState" : roleState
                },
                dataType: 'json',
                success: function (res) {
                    $(".modal-body p").text(res.msg);
                    $("#modalBootstrap").modal();
                },
                error: function(data) {
                    $(".modal-body p").text("服务器内部错误!");
                    $("#modalBootstrap").modal();
                }
            });
        } else {
            $.ajax({
                url: 'changeStateOfStu',
                type: 'POST',
                data: {
                    "IDNum" : account,
                    "roleState" : roleState
                },
                dataType: 'json',
                success: function (res) {
                    $(".modal-body p").text(res.msg);
                    $("#modalBootstrap").modal();
                },
                error: function(data) {
                    $(".modal-body p").text("服务器内部错误!");
                    $("#modalBootstrap").modal();
                }
            });
        }
    });
}).apply( this, [ jQuery ]);
/*========== 开关点击结束 ==========*/


/*========== 保存个人信息开始 ==========*/
function saveProfile() {
    var account = $("#demo-form input[name=account]").val();
    var name = $("#demo-form input[name=name]").val();
    var sex= $("#demo-form input[name=sex]:checked").val();
    var tel = $("#demo-form input[name=tel]").val();
    var email = $("#demo-form input[name=email]").val();
    var profile = $("#demo-form textarea[name=profile]").val();
    $.ajax({
        url: 'profileSave',
        data: {
            "account" : account,
            "name" : name,
            "sex" : sex,
            "tel" : tel,
            "email" : email,
            "profile" : profile
        },
        async: false,
        dataType: 'json',
        type: 'POST',
        success: function(data) {
            $.fn.magnificPopup('close');
            $(".modal-body p").text(data.msg);
            $("#modalBootstrap").modal();

        },
        error: function(data) {
            $.fn.magnificPopup('close');
            $(".modal-body p").text("服务器内部错误!");
            $("#modalBootstrap").modal();
        }
    });
}
/*========== 保存个人信息结束 ==========*/