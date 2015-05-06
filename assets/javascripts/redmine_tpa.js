$(document).ready(function(){
	$('.sidebar.right').css('min-height', $('.sidebar.left').height() + 2);
	
	$('.tpa-content').css('min-height', $('.sidebar.left').height() + 2);
	
	// $('.datepicker').datepicker({language: "en"});
	$('.datepicker').datepicker({
		language: "pt-BR",
		format: "yyyy-mm-dd"
	});

	// Select2 local
	$('.select2-local').each(function(i, elem) {
	  $(elem).select2();
	});

	// tag-for-pa
	$('body').on('click', '#tag-for-pa-trigger', function(e){
		e.preventDefault();
		$('#tag-for-pa').show();
	});

	$('body').on('change', '.appraisal_id_select', function(){
		if($(this).val() != ''){
			jQuery.ajax({
		      url: '/appraisals/' + $(this).val(),
		      timeout: 10000,
		      type: 'GET',
		      data: {
		      	questions_and_options: true, 
		      	issue_id: $(this).attr('id')
		      },
		      dataType: 'html',
		      success: function(data) {
		      	$('#questions-and-options').html(data);
		      },
		      error: function(x, t, m) {
		      	alert('Error');
		      }
		    });
		} else {
			$('#questions-and-options').html('');
		}

	})
});