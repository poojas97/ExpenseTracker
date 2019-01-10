class SessionsController < ApplicationController
	def new

	end
	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			redirect_to user_path(user), :flash => { :success => "You have successfully logged in"} 
		else
			flash.now[:danger] = "Wrong email id or password" 
			render 'new'
		end
	end
	def destroy
		session[:user_id] = nil
		redirect_to root_path, :flash => { :success => "You have logged out"} 
	end
end 