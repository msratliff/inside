class Venue < ApplicationRecord

	has_secure_password

	validates :email, uniqueness: {message: "Email address is already in use."}

	has_many :promotions
	
	geocoded_by :address
	after_validation :geocode, if: ->(obj){ ["street", "city", "state", "zipcode"].any? { |f| obj.send("#{f}_changed?".to_sym) }  }

  def address
		[street, city, state, zipcode, 'USA'].compact.join(', ')
  end
  
end
