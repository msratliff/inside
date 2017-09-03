$(document).on('turbolinks:load', function() {
	 
	$('.modal-footer .btn-primary').click(function() {
		$('.modal-body form').submit();
	});

});



