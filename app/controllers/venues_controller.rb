class VenuesController < ApplicationController

	before_action :set_venue, only: [:show, :edit, :update, :destroy, :analytics]
	before_action :authorize, only: [:show, :edit, :update, :destroy, :index]

	def index
		if params[:lat]
			@venues = Venue.near([params[:lat],params[:long]],2)
		elsif params[:search] && params[:search] != ""
			@venues = Venue.near(params[:search],10)
		else 
			@venues = []
		end

		respond_to do |format|
      format.html {render "index" }
      format.js {render :partial => "venues" }
    end
	end

	def analytics
		@promotions = Promotion.where(venue_id: @venue.id)
	end

	def show
		@promotions = Promotion.where(venue_id: @venue.id).day_of_week_order
	end

	def new
		@venue = Venue.new
	end

	def edit
	end	

	def create
		@venue = Venue.new(venue_params)
		
    respond_to do |format|
      if @venue.save
        session[:user_id] = nil
				session[:venue_id] = @venue.id
        format.html { redirect_to @venue, notice: 'Venue was successfully created.' }
        format.json { render :show, status: :created, location: @venue }
      else
        format.html { render :new }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
	end
	
	def update
		if current_venue.id == @venue.id
			respond_to do |format|
	      if @venue.update(venue_params)
	        format.html { redirect_to @venue, notice: 'Venue was successfully updated.' }
	        format.json { render :show, status: :ok, location: @venue }
	      else
	        format.html { render :edit }
	        format.json { render json: @venue.errors, status: :unprocessable_entity }
	      end
	  	end
  	end
	end

	def destroy
		if current_venue.id == @venue.id
			@venue.destroy
	    respond_to do |format|
	      format.html { redirect_to venues_url, notice: 'Venue was successfully destroyed.' }
	      format.json { head :no_content }
	    end
	  end
	end

	private

				

		def set_venue
			@venue = Venue.find(params[:id])
		end

		def venue_params
			params.require(:venue).permit(:name, :email, :password, :password_confirmation, :street, :city, :state, :zipcode, :search, :lat, :long, :description)
		end

end
