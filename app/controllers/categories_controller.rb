class CategoriesController < ApplicationController

	def index
		@categories= Category.where(user_id: current_user)
	end
	def edit
			@category = Category.find(params[:id])
	end
	
	def new
		@category = Category.new
	end

	def create
		#render plain: params[:category].inspect
		@category = Category.new(category_params)
		@category.user = current_user
		if  @category.save
			redirect_to category_path(@category),:flash => {:success => "category is added successfully" }
		else
			render 'new'
		end
	end

	def update
		@category = Category.find(params[:id])
		if @category.update(category_params)		
			redirect_to category_path(@category), :flash => {:success => "Category is updated successfully" }
		else
					render 'edit'
		end
	end

	

	def show
		@category = Category.find(params[:id])
	end
	def category_params
		params.require(:category).permit(:name)
	end


end