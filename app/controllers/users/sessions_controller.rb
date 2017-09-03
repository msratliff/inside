class Users::SessionsController < ApplicationController

  def new
  end

  def create
  	fb_create and return if request.env["omniauth.auth"]

    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:venue_id] = nil
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in!"
    else
      flash.now.alert = "Email or password is invalid"
      render "new"
    end

  end

  # login
  def fb_create
		# omniauth middleware stores oauth data in the request.env instead of params
    auth = request.env["omniauth.auth"]

		# even though this is a login action, an OAuth login can be a login *or* a registration
		#
		# if the user exists, log her in
		# if the user doesn't exist, create her, then log her in

		user = User.find_by(uid: auth['uid']) || User.create_from_facebook(auth)

		session[:user_id] = user.id

		redirect_to root_path, notice: "Signed in!"

  end

  def destroy
    session[:user_id] = nil
    redirect_to users_login_path, notice: "Logged out!"
  end


end
