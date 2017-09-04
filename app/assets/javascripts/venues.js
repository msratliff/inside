$(document).on('turbolinks:load', function() {

	$('.modal-footer .btn-primary').click(function() {
		$('.modal-body form').submit();
	});

	$("#desc-edit").click(function(evt) {
		evt.preventDefault;
	  $("#venue-description-display").css("display","none");
	  $("#edit-desc-form").css("display", "inline-block");
	});

});
