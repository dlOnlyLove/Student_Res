/*
Calendar
*/	
	
(function( $ ) {

	'use strict';

	var initCalendar = function() {
		var $calendar = $('#calendar');
		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();

		$calendar.fullCalendar({
			header: {
				left: 'title',
				right: 'prev,today,next'
			},

			timeFormat: 'h:mm',

			themeButtonIcons: {
				prev: 'fa fa-caret-left',
				next: 'fa fa-caret-right',
			},

		});

		// FIX INPUTS TO BOOTSTRAP VERSIONS
		var $calendarButtons = $calendar.find('.fc-header-right > span');
		$calendarButtons
			.filter('.fc-button-prev, .fc-button-today, .fc-button-next')
				.wrapAll('<div class="btn-group mt-sm mr-md mb-sm ml-sm"></div>')
				.parent()
				.after('<br class="hidden"/>');

		$calendarButtons
			.not('.fc-button-prev, .fc-button-today, .fc-button-next')
				.wrapAll('<div class="btn-group mb-sm mt-sm"></div>');

		$calendarButtons
			.attr({ 'class': 'btn btn-sm btn-default' });
	};

	$(function() {
		initCalendar();
	});


	/*========== 弹框开始 ==========*/
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
	/*========== 弹框结束 ==========*/


}).apply(this, [ jQuery ]);


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
		success: function(res) {
			$.fn.magnificPopup('close');
			$(".modal-body p").text(res.msg);
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