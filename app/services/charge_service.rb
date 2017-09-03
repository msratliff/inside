class ChargeService
	
	def self.create_customer(params)
		customer = Stripe::Customer.create(
	    :email => params[:stripeEmail],
	    :source  => params[:stripeToken]
	  )
	end
	
	def self.create_charge(customer_id, amount, charge_description)

	  charge = Stripe::Charge.create(
	    :customer    => customer_id,
	    :amount      => amount,
	    :description => charge_description,
	    :currency    => 'usd'
	  )

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path
	end

end