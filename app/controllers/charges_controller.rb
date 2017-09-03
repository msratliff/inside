class ChargesController < ApplicationController
	before_action :authorize
	before_action :set_promotion_charge, only: :create
	before_action :set_transaction, only: :show
	after_action :create_transaction, only: :create

	def index
		if current_user
			@transactions = current_user.transactions.all
		elsif current_venue
			@promotions = current_venue.promotions.all
			@transactions = current_venue.transactions.all
		end
		
	end

	def show
		@transaction = Transaction.find(params[:id])
	end

	def new
	end

	def create
	
		if current_user.stripe_id.present?
			charge = ChargeService.create_charge(current_user.stripe_id, @promotion.price*100)
		else
			customer = ChargeService.create_customer(params)
			@user = User.find(current_user.id)
			@user.stripe_id = customer.id
			@user.save
			charge = ChargeService.create_charge(current_user.stripe_id, @promotion.price*100)
		end
	
		redirect_to charge_path(@promotion)

	end


	private

		def set_promotion_charge
			@promotion = Promotion.find(params[:promotion_id])
		end

		def create_transaction
			@transaction = Transaction.new(promotion_id: @promotion.id, payment_method_id: ____________) 
		end

end
