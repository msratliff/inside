class Venues::SessionsController < ApplicationController
  	def new
	end

	def create
	  venue = Venue.find_by_email(params[:email])
	  if venue && venue.authenticate(params[:password])
	    session[:user_id] = nil
	    session[:venue_id] = venue.id
	    redirect_to venue_path, notice: "Logged in!"
	  else
	    flash.now.alert = "Email or password is invalid"
	    render "new"
	  end
	end

	def destroy
	  session[:venue_id] = nil
	  redirect_to venues_login_path, notice: "Logged out!"
	end

end
