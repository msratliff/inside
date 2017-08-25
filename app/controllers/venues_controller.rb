class VenuesController < ApplicationController

	before_action :set_venue, only: [:show, :edit, :update, :destroy]
	before_action :authorize

	def index
		@venues = Venue.all
	end

	def show
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
	        format.html { redirect_to @venue, notice: 'Venue was successfully created.' }
	        format.json { render :show, status: :created, location: @venue }
	      else
	        format.html { render :new }
	        format.json { render json: @venue.errors, status: :unprocessable_entity }
	      end
	    end
	end
	
	def update
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

	def destroy
		@venue.destroy
    respond_to do |format|
      format.html { redirect_to venues_url, notice: 'Venue was successfully destroyed.' }
      format.json { head :no_content }
    end
	end

	private

		def set_venue
			@venue = Venue.find(params[:id])
		end

		def venue_params
			params.require(:venue).permit(:name, :email, :password, :password_confirmation, :street, :city, :state, :zipcode)
		end

end
