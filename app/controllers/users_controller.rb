class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update, :show]
def new
	@user = User.new
end
def index

end

def create
	@user = User.new(user_params)
	if @user.save
		flash[:success]="WELCOME #{@user.name}"
		redirect_to expenses_path
	else
		render 'new'
	end

end

def edit 
	

end
def update
	
	if @user.update(user_params)
		flash[:success] = "Your details were updated successfully"
		redirect_to expenses_path
	else
		render 'edit'
	end

end
def show
	

end
def set_user
	 @user = User.find(params[:id])
end
	
		def user_params
			params.require(:user).permit(:name, :email, :password)

		end
end

