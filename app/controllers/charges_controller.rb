class ChargesController < ApplicationController
	before_action :authorize
	before_action :set_promotion_charge, only: [:create]
	before_action :set_transaction, only: [:show, :toggle_active]


	def index
		if current_user
			@transactions = current_user.transactions.all
		elsif current_venue
			@promotions = current_venue.promotions.all
			@transactions = current_venue.transactions.all
		end
		
	end

	def show
	end

	def toggle_active
    # @transaction.update_attribute(:active, false)

    respond_to do |format|
      format.js 
    end
    # redirect_to charges_path
	end

	def new
	end

	def create
		
		charge_description = "#{@promotion.venue.name} - #{@promotion.name} - #{@promotion.day_of_week}"
		if current_user.stripe_id.present?
			charge = ChargeService.create_charge(current_user.stripe_id, @promotion.price*100, charge_description)
		else
			customer = ChargeService.create_customer(params)
			@user = User.find(current_user.id)
			@user.stripe_id = customer.id
			@user.save
			charge = ChargeService.create_charge(current_user.stripe_id, @promotion.price*100, charge_description)

		end

		create_payment_method(charge)
		generate_confirmation_code
		create_transaction
		redirect_to charge_path(@transaction.id)

	end


	private

		def set_promotion_charge
			@promotion = Promotion.find(params[:promotion_id])
		end

		def set_transaction
			@transaction = Transaction.find(params[:id])
		end

		def generate_confirmation_code
			loop do 
				@confirmation_code = TokenPhrase.generate(" ",:colors => %w(), :numbers => false).split.join(" ")
				break @confirmation_code unless Transaction.where(confirmation_code: @confirmation_code).exists?
			end
		end

		def create_payment_method(charge)
			@payment_method = PaymentMethod.find_or_create_by(user_id: current_user.id, card_token: charge[:source][:id], card_last_four: charge[:source][:last4])
		end

		def confirmation_code
			
		end

		def create_transaction
			@transaction = Transaction.create(promotion_id: @promotion.id, payment_method_id: @payment_method.id, confirmation_code: @confirmation_code)
		end

end
