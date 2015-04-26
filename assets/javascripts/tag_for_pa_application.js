$(document).ready(function(){
	$('.sidebar.right').css('min-height', $('.sidebar.left').height() + 2);
	$('.tpa-content').css('min-height', $('.sidebar.left').height() + 2);
	// $('.datepicker').datepicker({language: "en"});
	$('.datepicker').datepicker({
		language: "pt-BR",
		format: "yyyy-mm-dd"
	});
});