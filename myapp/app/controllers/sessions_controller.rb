class SessionsController < ApplicationController
  def new
  end

  def create
  	user  = User.find_by(email: params[:email])

  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		if user.id == 1
  			flash[:success] = "Welcome to your home page admin"
  		else
  			flash[:success] = "Welcome to your home page"
  		end	
  		redirect_to root_path
  	else
  		flash.now[:danger] = "Your credentials are invalid"
  		render 'new'
  	end
  end

  def destroy
  	session[:user_id] = nil
  	flash.now[:success] = "Hoping to see you soon"
  	redirect_to root_path
  end

  
end
