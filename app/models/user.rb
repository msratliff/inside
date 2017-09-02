class User < ApplicationRecord

	has_secure_password

	validates  :email, presence: true, uniqueness: {message: "Email address is already in use."}
	validates :name, presence: true

	def self.create_from_facebook(auth)
		User.create!(
			uid: auth['uid'],
			name: auth['info']['name'],
			email: auth['info']['email'],
			password: "password",#needed for facebook login
			password_confirmation: "password" #TODO replace with random password gene
		)
	end

end
