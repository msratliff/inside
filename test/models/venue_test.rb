require 'test_helper'

class VenueTest < ActiveSupport::TestCase
  
	def setup
		@ven = Venue.create(name: "Wyn", email: "b@gy.com", street: "549 NW 28th St", city: "Miami", state: "FL", zipcode: "33127")
	end

  test "address is geocoded when created" do
    
    assert_not @ven.latitude.nil? 
    assert_not @ven.longitude.nil?

  end
  
  test "address is geocoded when updated" do
  	@ven.update(street: "400 NW 28th St")

  	assert_not @ven.latitude == 25.8030762
  end

end
