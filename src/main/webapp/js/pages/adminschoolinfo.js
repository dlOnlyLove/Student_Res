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
                sLengthMenu: '每页 _MENU_ 条数据',
                sProcessing: '<i class="fa fa-spinner fa-spin"></i> Loading',
                sEmptyTable: "表中没有数据!",
                sInfo: "当前 _START_ 到 _END_ 条数据!",
                sInfoEmpty: "",
                sInfoFiltered: "（从共 _MAX_ 条数据中筛选）",
                sLoadingRecords: "Loading...",
                sZeroRecords: "没有匹配的数据"
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
            $(".modal-body p").text("操作失败");
            $("#modalBootstrap").modal();
        }
    });
}