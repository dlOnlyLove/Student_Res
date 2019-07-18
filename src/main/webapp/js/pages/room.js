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


/*Datatable - editable*/
(function( $ ) {

    'use strict';

    var EditableTable = {

        options: {
            addButton: '#addToTable',
            table: '#datatable-editable',
            dialog: {
                wrapper: '#dialog',
                cancelButton: '#dialogCancel',
                confirmButton: '#dialogConfirm',
            }
        },

        initialize: function() {
            this
                .setVars()
                .build()
                .events();
        },

        setVars: function() {
            this.$table				= $( this.options.table );
            this.$addButton			= $( this.options.addButton );

            // dialog
            this.dialog				= {};
            this.dialog.$wrapper	= $( this.options.dialog.wrapper );
            this.dialog.$cancel		= $( this.options.dialog.cancelButton );
            this.dialog.$confirm	= $( this.options.dialog.confirmButton );

            return this;
        },

        build: function() {
            this.datatable = this.$table.DataTable({
                aoColumns: [
                    null,
                    null,
                    null,
                    null,
                    { "bSortable": false }
                ]
            });

            window.dt = this.datatable;

            return this;
        },

        events: function() {
            var _self = this;

            this.$table
                .on('click', 'a.save-row', function( e ) {
                    e.preventDefault();

                    _self.rowSave( $(this).closest( 'tr' ) );
                })
                .on('click', 'a.more-info', function( e ) {
                    e.preventDefault();

                    _self.rowMore( $(this).closest( 'tr' ) );
                })
                .on('click', 'a.cancel-row', function( e ) {
                    e.preventDefault();

                    _self.rowCancel( $(this).closest( 'tr' ) );
                })
                .on('click', 'a.edit-row', function( e ) {
                    e.preventDefault();

                    _self.rowEdit( $(this).closest( 'tr' ) );
                })
                .on( 'click', 'a.remove-row', function( e ) {
                    e.preventDefault();

                    var $row = $(this).closest( 'tr' );

                    $.magnificPopup.open({
                        items: {
                            src: '#dialog',
                            type: 'inline'
                        },
                        preloader: false,
                        modal: true,
                        callbacks: {
                            change: function() {
                                _self.dialog.$confirm.on( 'click', function( e ) {
                                    e.preventDefault();

                                    _self.rowRemove( $row );
                                    $.magnificPopup.close();
                                });
                            },
                            close: function() {
                                _self.dialog.$confirm.off( 'click' );
                            }
                        }
                    });
                });

            this.$addButton.on( 'click', function(e) {
                e.preventDefault();

                _self.rowAdd();
            });

            this.dialog.$cancel.on( 'click', function( e ) {
                e.preventDefault();
                $.magnificPopup.close();
            });

            return this;
        },

        // ==========================================================================================
        // ROW FUNCTIONS
        // ==========================================================================================
        rowAdd: function() {
            this.$addButton.attr({ 'disabled': 'disabled' });

            var actions,
                data,
                $row;

            actions = [
                '<a href="#" class="hidden on-editing save-row"><i class="fa fa-save"></i></a>',
                '<a href="#" class="hidden on-editing cancel-row"><i class="fa fa-times"></i></a>',
                '<a href="#" class="on-default edit-row"><i class="fa fa-pencil"></i></a>',
                '<a href="#" class="on-default remove-row"><i class="fa fa-trash-o"></i></a>',
                '<a href="#" class="on-default more-info"><i class="fa fa-file-text-o" ></i></a>'
            ].join(' ');

            data = this.datatable.row.add([ '', '', '', '', actions ]);
            $row = this.datatable.row( data[0] ).nodes().to$();

            $row
                .addClass( 'adding' )
                .find( 'td:last' )
                .addClass( 'actions' );

            this.rowEdit( $row );

            this.datatable.order([0,'asc']).draw(); // always show fields
        },

        rowCancel: function( $row ) {
            var $actions,
                data;

            if ( $row.hasClass('adding') ) {
                this.rowRemove( $row );
            } else {

                data = this.datatable.row( $row.get(0) ).data();
                this.datatable.row( $row.get(0) ).data( data );

                $actions = $row.find('td.actions');
                if ( $actions.get(0) ) {
                    this.rowSetActionsDefault( $row );
                }

                this.datatable.draw();
            }
        },

        rowEdit: function( $row ) {
            var _self = this,
                data;

            data = this.datatable.row( $row.get(0) ).data();

            if($row.hasClass('adding')) {
                $row.children( 'td' ).each(function( i ) {
                    var $this = $( this );

                    if ( $this.hasClass('actions') ) {
                        _self.rowSetActionsEditing( $row );
                    } else if(i == 2){
                        $this.html( '<input type="text" class="form-control input-block" disabled value="0"/>' );
                    } else {
                        $this.html( '<input type="text" class="form-control input-block" value="' + data[i] + '"/>' );
                    }
                });
            } else {
                $row.children( 'td' ).each(function( i ) {
                    var $this = $( this );

                    if ( $this.hasClass('actions') ) {
                        _self.rowSetActionsEditing( $row );
                    } else if(i == 1){
                        $this.html( '<input type="text" class="form-control input-block" value="' + data[i] + '"/>' );
                    } else {
                        $this.html( '<input type="text" class="form-control input-block" disabled value="' + data[i] + '"/>' );
                    }
                });
            }
        },

        rowSave: function( $row ) {
            var _self     = this,
                $actions,
                values;

            values = $row.find('td').map(function() {
                var $this = $(this);

                if ( $this.hasClass('actions') ) {
                    _self.rowSetActionsDefault( $row );
                    return _self.datatable.cell( this ).data();
                } else {
                    return $.trim( $this.find('input').val() );
                }
            });

            if ( $row.hasClass( 'adding' ) ) {
                this.$addButton.removeAttr( 'disabled' );
                $row.removeClass( 'adding' );

                // 增加新数据到数据库
                $.ajax({
                    url: 'addRoom',
                    type: 'POST',
                    data: {
                        "rno": values[0],
                        "roomSize": values[1],
                        "currentSize": values[2],
                        "major": values[3]
                    },
                    dataType: 'json',
                    success: function(res) {
                        alert(res.msg);
                    },
                    error: function() {
                        alert("服务器内部错误！");
                    }
                });
            } else {
                // 修改数据
                $.ajax({
                    url: 'updateRoom',
                    type: 'POST',
                    data: {
                        "rno": values[0],
                        "roomSize": values[1],
                        "currentSize": values[2],
                        "major": values[3]
                    },
                    dataType: 'json',
                    success: function(res) {
                        alert(res.msg);
                    },
                    error: function() {
                        alert("服务器内部错误！");
                    }
                });
            }

            this.datatable.row( $row.get(0) ).data( values );

            $actions = $row.find('td.actions');
            if ( $actions.get(0) ) {
                this.rowSetActionsDefault( $row );
            }

            this.datatable.draw();
        },

        rowRemove: function( $row ) {
            var data,
                rno;

            data = this.datatable.row( $row.get(0) ).data();
            rno = data[0];

            if ( $row.hasClass('adding') ) {
                this.$addButton.removeAttr( 'disabled' );
            } else {
                // 删除数据
                $.ajax({
                    url: 'deleteRoom',
                    type: 'POST',
                    data: {
                        "rno": rno
                    },
                    dataType: 'json',
                    success: function(res) {
                        alert(res.msg);
                    },
                    error: function() {
                        alert("服务器内部错误！");
                    }
                });
            }

            this.datatable.row( $row.get(0) ).remove().draw();
        },

        rowMore: function( $row ) {
            $.magnificPopup.open({
                items: {
                    src: '#room-more',
                    type: 'inline'
                },
                preloader: false,
                modal: true,
                callbacks: {
                    change: function() {
                    },
                    close: function() {}
                }
            });

            $("#more-close").on( 'click', function( e ) {
                e.preventDefault();
                $.magnificPopup.close();
            });
        },

        rowSetActionsEditing: function( $row ) {
            $row.find( '.on-editing' ).removeClass( 'hidden' );
            $row.find( '.on-default' ).addClass( 'hidden' );
        },

        rowSetActionsDefault: function( $row ) {
            $row.find( '.on-editing' ).addClass( 'hidden' );
            $row.find( '.on-default' ).removeClass( 'hidden' );
        }

    };

    $(function() {
        EditableTable.initialize();
    });

}).apply( this, [ jQuery ]);
