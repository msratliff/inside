require 'test_helper'

class VenueTest < ActiveSupport::TestCase
	
	def setup
		@ven1 = venues(:one)
		@ven2 = venues(:one)
	end

	test "should save venue with all info" do
		assert @ven2.valid?, "Saved the venue with all info"
	end

	test "should not save venue without email" do
		@ven2.email = nil
		assert_not @ven2.valid? , "Saved the venue without email"
	end

	test "should not save venue with taken email" do
		@ven1.save!
		assert_not @ven2.valid? , "Saved the venue with taken email"
	end

	test "should not save venue without password" do
		@ven2.password = nil
		assert_not @ven2.valid?, "Saved the venue without password"
	end

	test "address is geocoded when created" do
		@ven1.save
		assert_not @ven1.latitude.nil? 
		assert_not @ven1.longitude.nil?
	end
	
	test "address is geocoded when updated" do
		@ven1.save 
		@ven1.update(street: "400 NW 28th St")
		assert_not @ven1.latitude == 25.8030762
	end

end
