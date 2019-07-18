//file-encoding is UTF-8
// Data Tables - Config
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
            bSearchable: true,
            bSortable: true,
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
            // DataTable.defaults.column = {

            // },
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


/*Datatable - default*/
(function( $ ) {

    'use strict';

    var datatableInit = function() {

        $('#datatable-default').dataTable();

    };

    $(function() {
        datatableInit();
    });

}).apply( this, [ jQuery ]);