class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :validate_same_user, only: [:update, :destroy, :show]
  
  def new
    @user = User.new
  end
  def index

  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to expenses_path, flash: { success: "WELCOME #{@user.name}"} 
    else
      render 'new'
    end 
  end

  def edit 
    
  end

  def update
    
    if @user.update(user_params)
      redirect_to expenses_path, flash: { success: "Your details were updated successfully"} 
    else
      render 'edit'
    end

  end

  def show
    

  end
  def set_user
    @user = User.find(params[:id])
  end

  def validate_same_user    
    redirect_to root_path, flash: {danger: "You can only edit your own account" } if current_user != @user
  end
    
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end

