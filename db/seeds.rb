# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Venue.destroy_all
Promotion.destroy_all


3.times do |user|
	user = User.create(name: Faker::GameOfThrones.character, email: Faker::Internet.free_email, password_digest: Faker::Internet.password(5, 6))
end

weekdays = ["Thursday", "Friday", "Saturday"]

3.times do |venue|
	venue = Venue.create(name: Faker::Ancient.hero, email: Faker::Internet.free_email, password_digest: Faker::Internet.password(5, 6), street: "78 NW 25th St", city: "Miami", state: "FL", zipcode: 33127)
	weekdays.each do |weekday|
		promotion = Promotion.create(day_of_week: weekday, time: Faker::Time.between(2.days.ago, Date.today, :afternoon), price: Faker::Commerce.price, venue_id: venue.id)
	end
end
