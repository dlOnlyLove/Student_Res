/* lightbox */
(function(theme, $) {

    theme = theme || {};

    var instanceName = '__lightbox';

    var PluginLightbox = function($el, opts) {
        return this.initialize($el, opts);
    };

    PluginLightbox.defaults = {
        tClose: 'Close (Esc)', // Alt text on close button
        tLoading: 'Loading...', // Text that is displayed during loading. Can contain %curr% and %total% keys
        gallery: {
            tPrev: 'Previous (Left arrow key)', // Alt text on left arrow
            tNext: 'Next (Right arrow key)', // Alt text on right arrow
            tCounter: '%curr% of %total%' // Markup for "1 of 7" counter
        },
        image: {
            tError: '<a href="%url%">The image</a> could not be loaded.' // Error message when image could not be loaded
        },
        ajax: {
            tError: '<a href="%url%">The content</a> could not be loaded.' // Error message when ajax request failed
        }
    };

    PluginLightbox.prototype = {
        initialize: function($el, opts) {
            if ( $el.data( instanceName ) ) {
                return this;
            }

            this.$el = $el;

            this
                .setData()
                .setOptions(opts)
                .build();

            return this;
        },

        setData: function() {
            this.$el.data(instanceName, this);

            return this;
        },

        setOptions: function(opts) {
            this.options = $.extend(true, {}, PluginLightbox.defaults, opts, {
                wrapper: this.$el
            });

            return this;
        },

        build: function() {
            this.options.wrapper.magnificPopup(this.options);

            return this;
        }
    };

    // expose to scope
    $.extend(theme, {
        PluginLightbox: PluginLightbox
    });

    // jquery plugin
    $.fn.themePluginLightbox = function(opts) {
        return this.each(function() {
            var $this = $(this);

            if ($this.data(instanceName)) {
                return $this.data(instanceName);
            } else {
                return new PluginLightbox($this, opts);
            }

        });
    }

}).apply(this, [ window.theme, jQuery ]);

(function( $ ) {

    'use strict';

    if ( $.isFunction($.fn[ 'magnificPopup' ]) ) {

        $(function() {
            $('[data-plugin-lightbox], .lightbox:not(.manual)').each(function() {
                var $this = $( this ),
                    opts = {};

                var pluginOptions = $this.data('plugin-options');
                if (pluginOptions)
                    opts = pluginOptions;

                $this.themePluginLightbox(opts);
            });
        });

    }

}).apply(this, [ jQuery ]);
/* End lightbox */


/* Start dataTable */
(function($) {

    'use strict';

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

        $('#datatable').dataTable();

    };

    $(function() {
        datatableInit();
    });

}).apply( this, [ jQuery ]);

function noPass(object) {

    var IDNum = $(object).parent().parent().children('td').eq(0).html();
    var green = "审核不通过";

    $("#checkForm input[name=IDNum]").val(IDNum);
    $("#checkForm input[name=green]").val(green);
    $("#checkForm").submit();
}

function pass(object) {
    var IDNum = $(object).parent().parent().children('td').eq(0).html();
    var green = "审核通过";

    $("#checkForm input[name=IDNum]").val(IDNum);
    $("#checkForm input[name=green]").val(green);
    $("#checkForm").submit();
}
