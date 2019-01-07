class CategoriesController < ApplicationController

def index
	@category= Category.all
end
  def edit
   		@category = Category.find(params[:id])
   end
 	def create
 		#render plain: params[:category].inspect
 		@category = Category.new(category_params)
     
      	if	@category.save
      	  flash[:success] = "category is added successfully"
 		  redirect_to category_path(@category)
 	    else
 		  render 'new'
 		end
 	end

 	def update
   	@category = Category.find(params[:id])
      	if	@category.update(category_params)
      	  flash[:success] = "Category is updated successfully"
 		  redirect_to category_path(@category)
 	    else
 		  render 'edit'
 		end

   end



	def new
 		@category = Category.new
 	end

def show
    @category = Category.find(params[:id])
end
def category_params
			params.require(:category).permit(:category_name)
		end


end