class User < ApplicationRecord
	
	has_secure_password

	validates :email, presence: true, uniqueness: {message: "Email address is already in use."}
	
end
