class PromotionsController < ApplicationController

	before_action :set_promotion, only: [:show, :edit, :update,:destroy]


	def show
	end

	def new 
	end

	def edit
	end

	def create
	end

	def update
	end

	def destroy
	end

	private

	def set_promotion
		@promotion = Promotion.find(params[:id])
	end

	def post_params
		params.require(:promotion).permit(:day_of_week, :time, :price)
	end

end
