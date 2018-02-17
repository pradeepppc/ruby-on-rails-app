class UserController < ApplicationController
	def list
		@users = User.all	
	end

	def new

	end

	def create
		if (params[:name] == "" or params[:email] == "" or params[:password] == "")
			puts "nil enter"
			flash.now[:danger] = "please fill all the fields"
			render :action => 'new'
		elsif(params[:password].length <= 6)
			puts "pass len check"
			flash.now[:danger] = "password should be atlest have 7 charecters"
			render :action => 'new'
		elsif((params[:email].include? "@") and (params[:email].length > 4))
			puts 'ok email checked'
			user = User.new(name: params[:name] , email: params[:email] ,password: params[:password])
			if user.save
				flash.now[:success] = "please login"
				redirect_to :controller => 'sessions' , :action => 'new'
			else
				flash.now[:danger] = "This email is already taken please select another email"
				render :action => 'new'
			end
		else
			flash.now[:danger] = "email should have @ symbol and should have atleast 4 charecters"
			render :action => 'new'	
		end

	end

	def user_params
		params.require(:user).permit(:name , :email , :password)
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to 'list'
	end

end
