$(document).ready(function(){
	$('body').on('change', '#appraisal_appraisal_id', function(){
		if($(this).val() != ''){
			jQuery.ajax({
	      url: '/appraisals_templates/' + $(this).val(),
	      timeout: 10000,
	      type: 'GET',
	      data: {
	      	ajax_show: true
	      },
	      dataType: 'html',
	      success: function(data) {
	      	$('#appraisal-template-info').html(data);
	      },
	      error: function(x, t, m) {
	      	alert('Error');
	      }
	    });
		} else {
			$('#appraisal-template-info').html('');
		}
	});
});