$(document).on('turbolinks:load', function() {
	 
	$('.checkbox-toggle').click(function() {
		var trans_id = this.id.substring(0, this.id.indexOf("-")); 
		if(confirm('Confirm Purchase?')){
      $("[action='/charges/"+trans_id+"/confirm']").submit();
    }else{
      return false;
    }   
		
	});

});
