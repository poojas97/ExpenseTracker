class CategoriesController < ApplicationController
  before_action :validate_user
  before_action :validate_same_user, only: [:update, :destroy, :show]
  before_action :scope , only: [:show, :update, :destroy, :edit]

  def index
    @categories = current_user.categories
  end
  
  
  def new
    @items = current_user.categories.new
  end

  def create

    @items = current_user.categories.new(category_params)
    @items.user = current_user
    if  @items.save
      redirect_to category_path(@items),flash: {success: "category is added successfully" }
    else
      # redirect_to controller: 'expenses', action: 'new_release' 
  
      # render partial:'expenses/new_release'
      #     respond_to do |format|
      #   format.js { render 'create.js.erb' }
      # end

    end
  end
  
  def edit

  end

  def update

    if @items.update(category_params)   
      redirect_to category_path(@items), flash: {success: "Category name is updated successfully" }
    else
          render 'edit'
    end
  end
  def destroy
    if @items.destroy
      redirect_to categories_path, flash: {danger: "Category was deleted" }
    else
      redirect_to expenses_path, flash: {danger: "Something went wrong" }
    end
  end
  

  def show
    
  end

  def validate_same_user
    @category = Category.find(params[:id])
    redirect_to root_path, flash: {danger: "You can only delete your categories" } if current_user != @category.user
    
  end
  def scoper 
    "categories"
  end

  def category_params
    params.require(:category).permit(:name)
  end


end