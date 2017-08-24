class VenuesController < ApplicationController

	before_action :set_venue, only: [:show, :edit, :update, :destroy]

	def index
		@venues = Venue.all
	end

	def show
	end

	def new
		@venue = Venue.new
	end

	def create
		@venue = Venue.new(venue_params)
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def set_venue
		@venue = Venue.find(params[:id])
	end

	def venue_params
		params.require(:venue).permit(:name, :email, :password, :password_confirmation, :name, :street)
	end


end
