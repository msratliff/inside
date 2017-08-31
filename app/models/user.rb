class User < ApplicationRecord
	
	has_secure_password
	has_many :payment_methods

	validates :email, presence: true, uniqueness: {message: "Email address is already in use."}
	

end
