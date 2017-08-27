require 'test_helper'

class VenueTest < ActiveSupport::TestCase
  
	def setup
		@ven1 = Venue.create!(name: "Wyn", email: "a@email.com", street: "549 NW 28th St", city: "Miami", state: "FL", zipcode: "33127", password: "1234")
    @ven2 = Venue.new(name: "Wyn", email: "b@email.com", street: "549 NW 28th St", city: "Miami", state: "FL", zipcode: "33127", password: "1234")
	end

  test "should save venue with all info" do
    assert @ven2.save!, "Saved the venue with all info"
  end

  test "should not save venue without email" do
    @ven2.email = nil
    assert_not @ven2.save!, "Saved the venue without email"
  end

  # test "should not save venue with taken email" do
  #   @ven2.email = "a@email.com"
  #   assert_not @ven2.save!, "Saved the venue with taken email"
  # end

  # test "should not save venue without password" do
  #   @ven2.password = nil
  #   assert_not @ven2.save!, "Saved the venue without password"
  # end

  test "address is geocoded when created" do
    assert_not @ven1.latitude.nil? 
    assert_not @ven1.longitude.nil?
  end
  
  test "address is geocoded when updated" do
  	@ven1.update(street: "400 NW 28th St")
  	assert_not @ven1.latitude == 25.8030762
  end

end
