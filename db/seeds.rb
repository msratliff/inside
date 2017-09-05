# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Promotion.destroy_all
Venue.destroy_all

user1 = User.create(name: "Einar Montalvo", email: "einar.m@hiringpartner.co", password_digest: Faker::Internet.password(5, 6))
paymeth = PaymentMethod.create(user_id: user1.id, card_token: Faker::Commerce.promotion_code, card_last_four: "4242")
venue1 = Venue.create(name: "Wyncode Academy", email: "jo@wyncode.co", password_digest: Faker::Internet.password(5, 6), street: "549 NW 28th St", city: "Miami", state: "FL", zipcode: 33127, description: "Located in the heart of Miami's Wynwood Arts District, Wyncode Academy is an immersive coding bootcamp licensed by the Florida Department of Education. Based on industry leading concepts and technologies, our curriculum covers HTML, CSS, Javascript, and Ruby on Rails.")

venue2 = Venue.create(name: "Wynwood Brewing Company", email: "wbc@brewery.co", password_digest: Faker::Internet.password(5, 6), street: "565 NW 24th St", city: "Miami", state: "FL", zipcode: 33127, description: "Artsy area's first craft production brewery with a taproom pouring seasonal, limited-edition beers.")

venue3 = Venue.create(name: "Concrete Beach Brewery", email: "cbb@brewery.co", password_digest: Faker::Internet.password(5, 6), street: "325 NW 24th St", city: "Miami", state: "FL", zipcode: 33127, description: "Huge space with a brewery, a taproom & an indoor/outdoor bar pouring signature & seasonal brews.")

venue4 = Venue.create(name: "SHOTS Miami", email: "sm@brewery.co", password_digest: Faker::Internet.password(5, 6), street: "311 NW 23rd St", city: "Miami", state: "FL", zipcode: 33127, description: "Lively dance club popular for pouring shots of alcohol & featuring DJs & weekend food trucks.")

venue5 = Venue.create(name: "Gramps", email: "gamps@drinking.co", password_digest: Faker::Internet.password(5, 6), street: "176 NW 24th St", city: "Miami", state: "FL", zipcode: 33127, description: "Trendy hangout serving cocktails & craft beer amid live entertainment ranging from bands to comics.")

venue5 = Venue.create(name: "Phillip and Patricia Frost Museum of Science", email: "frost@science.co", password_digest: Faker::Internet.password(5, 6), street: "1101 Biscayne Blvd", city: "Miami", state: "FL", zipcode: 33132, description: "The Phillip and Patricia Frost Museum of Science is a science museum, planetarium, and aquarium located in Miami, Florida, US")

promotion = Promotion.create(name: "Facebook Dev Circles", day_of_week: "Wednesday", time: DateTime.new(2017,9,7,15,0,0), price: 10, venue_id: venue1.id, description: "Attend local meetups, collaborate in Facebook Groups and learn about the latest Facebook technologies.")

promotion2 = Promotion.create(name: "Hurricane Party", day_of_week: "Friday", time: DateTime.new(2017,9,7,15,0,0), price: 15, venue_id: venue1.id, description: "Weather out the storm at Wyncode. Why are we still here? Be safe. $15 at the door or a gallon of potable water.")

promotion3 = Promotion.create(name: "Escape Room - Cohort 18", day_of_week: "Friday", time: DateTime.new(2017,9,7,15,0,0), price: 15, venue_id: venue1.id, description: "Get to know your fellow cohort members at our escape room event. We're charging you for this for some reason? This is in addition to your tuition.")

trans = Transaction.create(payment_method_id: PaymentMethod.last.id, promotion_id: promotion2.id, confirmation_code: TokenPhrase.generate(" ",:colors => %w(), :numbers => false).split.join(" "))
trans1 = Transaction.create(payment_method_id: PaymentMethod.last.id, promotion_id: promotion2.id, confirmation_code: TokenPhrase.generate(" ",:colors => %w(), :numbers => false).split.join(" "))
trans2 = Transaction.create(payment_method_id: PaymentMethod.last.id, promotion_id: promotion2.id, confirmation_code: TokenPhrase.generate(" ",:colors => %w(), :numbers => false).split.join(" "))
trans3 = Transaction.create(payment_method_id: PaymentMethod.last.id, promotion_id: promotion2.id, confirmation_code: TokenPhrase.generate(" ",:colors => %w(), :numbers => false).split.join(" "))
trans4 = Transaction.create(payment_method_id: PaymentMethod.last.id, promotion_id: promotion2.id, confirmation_code: TokenPhrase.generate(" ",:colors => %w(), :numbers => false).split.join(" "))
trans5 = Transaction.create(payment_method_id: PaymentMethod.last.id, promotion_id: promotion2.id, confirmation_code: TokenPhrase.generate(" ",:colors => %w(), :numbers => false).split.join(" "))

trans6 = Transaction.create(payment_method_id: PaymentMethod.last.id, promotion_id: promotion2.id, confirmation_code: TokenPhrase.generate(" ",:colors => %w(), :numbers => false).split.join(" "))

trans7 = Transaction.create(payment_method_id: PaymentMethod.last.id, promotion_id: promotion2.id, confirmation_code: TokenPhrase.generate(" ",:colors => %w(), :numbers => false).split.join(" "))

trans8 = Transaction.create(payment_method_id: PaymentMethod.last.id, promotion_id: promotion2.id, confirmation_code: TokenPhrase.generate(" ",:colors => %w(), :numbers => false).split.join(" "))

trans9 = Transaction.create(payment_method_id: PaymentMethod.last.id, promotion_id: promotion2.id, confirmation_code: TokenPhrase.generate(" ",:colors => %w(), :numbers => false).split.join(" "))

trans10 = Transaction.create(payment_method_id: PaymentMethod.last.id, promotion_id: promotion2.id, confirmation_code: TokenPhrase.generate(" ",:colors => %w(), :numbers => false).split.join(" "))

trans11 = Transaction.create(payment_method_id: PaymentMethod.last.id, promotion_id: promotion2.id, confirmation_code: TokenPhrase.generate(" ",:colors => %w(), :numbers => false).split.join(" "))