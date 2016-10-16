
jQuery(document).on('ready page:change', function() {
  'use strict';

	$(".form-show-answers").on('click', function(){
		$('.form-question-answered-wrapper').slideToggle();
	});

	$(".file-upload").fileinput({
		showPreview: false,
		showCaption: false
	});
	
	$(".form-download-pdf").on('click', function(){
		var doc = new jsPDF();          
		var elementHandler = {
		  '#ignorePDF': function (element, renderer) {
		    return true;
		  }
		};
		var source = window.document.getElementsByTagName("body")[0];
		doc.fromHTML( source, 12, 12,{
	    'width': 140,'elementHandlers': elementHandler
		});

		doc.output("dataurlnewwindow");
	});


});