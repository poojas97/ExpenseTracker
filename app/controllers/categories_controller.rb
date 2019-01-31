class CategoriesController < ApplicationController
  before_action :validate_user
  before_action :validate_same_user, only: [:update, :destroy, :show]
  before_action :scope , only: [:show, :update, :destroy, :edit]

  def index
    @categories = current_user.categories
  end
  
  
  # def new
  #   @item = current_user.categories.new
  #   respond_to do |format|
  #     format.html {render 'expenses/new_category'}
  #     format.js   {render 'expenses/new_category.js.erb'}
  #   end

  # end

  def create 
        @flag = 0
        @categories_present = current_user.categories.pluck(:name)
        @item = current_user.categories.new(name: params[:name])
        @item.user = current_user
        @categories_present.each do |c|
              if c == @item.name
                    @flag= 1
                    break
              end
        end
          respond_to do |format|

              if @flag == 1
                  format.json { render json: { success:  false, message: "Category is already present" } }
              elsif @item.save
                       format.json { render json: { success:  true, message: "category created" } }    
              else 
                       format.json { render json: { success:  false, message: @item.errors.full_messages } }
              end
                  
          end
  end

  def edit

  end

  def update

    if @item.update(category_params)   
      redirect_to category_path(@item), flash: {success: "Category name is updated successfully" }
    else
          render 'edit'
    end
  end

  def destroy
    if @item.destroy
      redirect_to categories_path, flash: {danger: "Category was deleted" }
    else
      redirect_to expenses_path, flash: {danger: "Something went wrong" }
    end
  end
  

  def show
    sum 
  end
  def sum
    @sum = 0
    @c = Expense.where(category_id: params[:id], user_id: current_user) 
      @c.each do |t|  
      @sum = @sum + t.amount
    end
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