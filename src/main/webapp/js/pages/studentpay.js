
(function( $ ) {

    'use strict';

    /*
    Wizard #4
    */
    var $w4finish = $('#w4').find('ul.pager li.finish'),
        $w4validator = $("#w4 form").validate({
            highlight: function(element) {

                $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
            },
            success: function(element) {
                $(element).closest('.form-group').removeClass('has-error');
                $(element).remove();
            },
            errorPlacement: function( error, element ) {
                element.parent().append( error );
            }
        });

    // $w4finish.on('click', function( ev ) {
    //     ev.preventDefault();
    //     alert("bb");
    //     // var validated = $('#w4 form').valid();
    //     // if ( validated ) {
    //     //     new PNotify({
    //     //         title: 'Congratulations',
    //     //         text: 'You completed the wizard form.',
    //     //         type: 'custom',
    //     //         addclass: 'notification-success',
    //     //         icon: 'fa fa-check'
    //     //     });
    //     // }
    // });

    $('#w4').bootstrapWizard({
        tabClass: 'wizard-steps',
        nextSelector: 'ul.pager li.next',
        previousSelector: 'ul.pager li.previous',
        firstSelector: null,
        lastSelector: null,
        onNext: function( tab, navigation, index, newindex ) {
            var validated = $('#w4 form').valid();
            if( !validated ) {
                $w4validator.focusInvalid();
                return false;
            }
        },
        onTabClick: function( tab, navigation, index, newindex ) {
            if ( newindex == index + 1 ) {
                return this.onNext( tab, navigation, index, newindex);
            } else if ( newindex > index + 1 ) {
                return false;
            } else {
                return true;
            }
        },
        onTabChange: function( tab, navigation, index, newindex ) {
            var $total = navigation.find('li').length - 1;
            $w4finish[ newindex != $total ? 'addClass' : 'removeClass' ]( 'hidden' );
            $('#w4').find(this.nextSelector)[ newindex == $total ? 'addClass' : 'removeClass' ]( 'hidden' );
        },
        onTabShow: function( tab, navigation, index ) {
            var $total = navigation.find('li').length - 1;
            var $current = index;
            var $percent = Math.floor(( $current / $total ) * 100);
            $('#w4').find('.progress-indicator').css({ 'width': $percent + '%', 'background': '#73B9FF' });
            tab.prevAll().addClass('completed');
            tab.nextAll().removeClass('completed');
        }
    });

}).apply( this, [ jQuery ]);

(function ( $ ) {
    var totalMoney = 4500;

    $("input[name=pay]").on('click', function () {
        var isCheck = $("input[name=pay]").prop("checked");
        var dressMoney;
        if(isCheck) {
            totalMoney = 4600;
            dressMoney = 100;
        } else {
            totalMoney = 4500;
            dressMoney = 0;
        }
        $("#dressMoney").text("￥" + dressMoney);
        $("#totalMoney").text("￥" + totalMoney);
    });

    var $w4finish = $('#w4').find('ul.pager li.finish');
    $w4finish.on('click', function( ev ) {
        ev.preventDefault();
        $("#payForm input[name=out_trade_no]").val(GetDateNow());
        $("#payForm input[name=total_amount]").val(totalMoney);
        $("#payForm").submit();
    });
}).apply( this, [ jQuery ] );

function GetDateNow() {
    var vNow = new Date();
    var sNow = "";
    sNow += String(vNow.getFullYear());
    sNow += String(vNow.getMonth() + 1);
    sNow += String(vNow.getDate());
    sNow += String(vNow.getHours());
    sNow += String(vNow.getMinutes());
    sNow += String(vNow.getSeconds());
    sNow += String(vNow.getMilliseconds());
    return sNow != null ? sNow : null;
}
