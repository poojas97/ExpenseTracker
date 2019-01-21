class CategoriesController < ApplicationController
	before_action :require_user
	before_action :set_value , only: [:show, :update, :destroy]
	before_action :require_same_user, only: [:update, :destroy, :show]

	def index
		@categories= Category.where(user_id: current_user)
	end
	
	
	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		@category.user = current_user
		if  @category.save
			redirect_to category_path(@category),:flash => {:success => "category is added successfully" }
		else
			render 'new'
		end
	end

	def update
		
		if @category.update(category_params)		
			redirect_to category_path(@category), :flash => {:success => "Category is updated successfully" }
		else
					render 'edit'
		end
	end
	def destroy
		@category.destroy
		redirect_to categories_path, :flash => {:danger => "Category was deleted" }
	end
	

	def show
		
	end
	def set_value
		@category = Category.find(params[:id])
	end
	def require_same_user
		@category = Category.find(params[:id])
		redirect_to root_path, :flash => {:danger => "You can only delete your categories" } if current_user != @category.user
		
	end
	def category_params
		params.require(:category).permit(:name)
	end


end