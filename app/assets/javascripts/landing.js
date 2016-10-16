//= require jquery
//= require jquery_ujs
//= require image-scale.js


$(document).on('ready', function() {
  $(".hero__image img").imageScale({
  	scale: 'best-fill',
  	align: 'center',
  	rescaleOnResize: true
  });
});