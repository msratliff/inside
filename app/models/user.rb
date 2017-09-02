class User < ApplicationRecord
	
	has_secure_password
	has_many :payment_methods

	validates :email, presence: true, uniqueness: {message: "Email address is already in use."}
	# before_save :strip_user


	# def stripe_user(params)
	# 	customer = Stripe::Customer.create(
	#     :email => params[:email],
	#     :source  => params[:stripeToken],
	#   )
		
	# end

end
