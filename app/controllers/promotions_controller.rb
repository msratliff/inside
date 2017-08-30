class PromotionsController < ApplicationController

	before_action :set_promotion, only: [:show, :edit, :update,:destroy]


	def show
	end

	def new 
		@days_of_week = ['Sunday','Monday','Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday' ]
		@promotion = Promotion.new
	end

	def edit
	end

	def create
		@promotion = Promotion.new(promotion_params)

	    respond_to do |format|
	      if @promotion.save
	        format.html { redirect_to @promotion, notice: 'Promotion was successfully created.' }
	        format.json { render :show, status: :created, location: @promotion }
	      else
	        format.html { render :new }
	        format.json { render json: @promotion.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def update
		respond_to do |format|
	      if @promotion.update(promotion_params)
	        format.html { redirect_to @promotion, notice: 'Promotion was successfully updated.' }
	        format.json { render :show, status: :ok, location: @promotion }
	      else
	        format.html { render :edit }
	        format.json { render json: @promotion.errors, status: :unprocessable_entity }
	      end
    	end
	end

	def destroy
		@promotion.destroy
    respond_to do |format|
      format.html { redirect_to promotions_url, notice: 'Promotion was successfully destroyed.' }
      format.json { head :no_content }
    end
	end

	private

	def set_promotion
		@promotion = Promotion.find(params[:id])
	end

	def promotion_params
		params.require(:promotion).permit(:day_of_week, :time, :price)
	end

end
