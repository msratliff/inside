require 'test_helper'

class PromotionTest < ActiveSupport::TestCase
  
  def setup
		@ven = Venue.create!(name: "Wyn", email: "b@gy.com", street: "549 NW 28th St", city: "Miami", state: "FL", zipcode: "33127", password_digest: "1234")
		@promo = Promotion.new(day_of_week: "Monday", price: 15, time: DateTime.new(2017,8,24,10,49,37), venue_id: @ven.id )
	end

  test "should save promotion with all info" do
	  assert @promo.save!, "Saved the promotion with all info"
	end

  test "should not save promotion without day of week" do
	  @promo.day_of_week = nil
	  assert_not @promo.save, "Saved the promotion without a day of week"
	end

	test "should not save promotion without price" do
	  @promo.price = nil
	  assert_not @promo.save, "Saved the promotion without a price"
	end

	test "should not save promotion without time" do
	  @promo.time = nil
	  assert_not @promo.save, "Saved the promotion without a time"
	end
	

end
