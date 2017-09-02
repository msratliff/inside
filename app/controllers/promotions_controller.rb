class PromotionsController < ApplicationController

	before_action :set_promotions_venue
	before_action :set_promotion, only: [:show, :edit, :update, :destroy]
	before_action :set_time, only: [:create, :update]


	def show
	end

	def new 
		@days_of_week = ['Sunday','Monday','Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday' ]
		@promotion = Promotion.new
	end

	def edit
	end

	def create
		@promotion = @venue.promotions.create(promotion_params)
    @promotion.venue_id = current_venue.id
    @promotion.save

		respond_to do |format|
			if @promotion.save
        format.html { redirect_to venue_path(params[:venue_id]) }
        format.json { render :show, status: :created, location: @promotion }
      else
        format.html { render :new }
        format.json { render json: @promotion.errors, status: :unprocessable_entity }
      end
    end
	end

	def update
		if current_venue.id = @venue.id
			respond_to do |format|
	      if @promotion.update(promotion_params)
	        format.html { redirect_to venue_path(current_venue) }
	        format.json { render :show, status: :ok, location: @promotion }
	      else
	        format.html { render :edit }
	        format.json { render json: @promotion.errors, status: :unprocessable_entity }
	      end
	  	end
	  end
	end

	def destroy
		if current_venue.id = @venue.id
			@promotion.destroy
	    respond_to do |format|
	      format.html { redirect_to venue_path(current_venue), notice: 'Promotion was successfully destroyed.' }
	      format.json { head :no_content }
	    end
    end
	end

	private

	def set_promotion
		@promotion = Promotion.find(params[:id])
	end

	def set_promotions_venue
		@venue = Venue.find(params[:venue_id])
	end

	def set_time
		params[:promotion][:time] = DateTime.new(params[:promotion]["time(1i)"].to_i, params[:promotion]["time(2i)"].to_i, params[:promotion]["time(3i)"].to_i, params[:promotion]["time(4i)"].to_i, params[:promotion]["time(5i)"].to_i)
	end

	def promotion_params
		params.require(:promotion).permit(:name, :day_of_week, :time, :price, :description)
	end

end
