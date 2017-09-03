class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_venue
    @current_venue ||= Venue.find(session[:venue_id]) if session[:venue_id]
  end
  
  helper_method :current_user
  helper_method :current_venue

  def authorize
    redirect_to '/users/login' unless (current_user || current_venue)
  end

end