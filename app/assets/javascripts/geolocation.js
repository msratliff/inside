$(function(){
	
	
	// Locate Button Ajax Call
	var lat, long;
	
	var geoSuccess = function(position) {
	  lat = position.coords.latitude
	  long = position.coords.longitude
	  $('#lat').val(lat);
	  $('#long').val(long);

	  var url = `/venues`

	  $.ajax({
    	url: url,
    	contentType: 'application/json',
    	type: 'GET',
    	data: {
    		lat: lat, 
    		long: long,
    	}
    }).done(function(data){
    	var venues = $(data).find('#content');
    	$('.venues').replaceWith(venues)
    });
  };
  
  $('#locate').click(function(evt){
  	evt.preventDefault();
  	navigator.geolocation.getCurrentPosition(geoSuccess);
  });

//*****************************************************//

  // Search Button Ajax Call
  $('#search-btn').click(function(evt){
  	evt.preventDefault();
  	
  	var url = `/venues/`

	  $.ajax({
    	url: url,
    	contentType: 'application/json',
    	type: 'GET',
    	data: {
    		search: $('#search')[0].value
    	}
    }).done(function(data){
    	var venues = $(data).find('#content');
    	$('.venues').replaceWith(venues)
    });
  });
});
