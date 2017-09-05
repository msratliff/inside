$(document).on('turbolinks:load', function() {
	
	
	// Locate Button Ajax Call
	var lat, long;
	
	var geoSuccess = function(position) {
	  
    lat = position.coords.latitude
	  long = position.coords.longitude
	  
	  var url = "/venues"

    
    // Populates Neighborhood, City, State

    $.ajax({ 
      url:"http://maps.googleapis.com/maps/api/geocode/json?latlng="+lat+","+long+"&sensor=true",
      success: function(data){
        $('#search').val(data.results[2].formatted_address);
      }
    });

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
    	$('.venues').html(venues)
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
  	
  	var url = "/venues/"

	  $.ajax({
    	url: url,
    	contentType: 'application/json',
    	type: 'GET',
    	data: {
    		search: $('#search')[0].value
    	}
    }).done(function(data){
    	var venues = $(data).find('#content');
    	$('.venues').html(venues)
    });
  });
});
