
jQuery(document).on('ready page:change', function() {
  'use strict';

	$(".form-show-answers").on('click', function(){
		$('.form-question-answered-wrapper').slideToggle();
	});

	$(".file-upload").fileinput({
		showPreview: false,
		showCaption: false
	});




});