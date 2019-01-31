class ExpensesController < ApplicationController
  before_action :validate_user
  before_action :validate_same_user, only: [:edit, :update, :destroy, :show]
  before_action :scope , only: [:edit, :show, :update, :destroy]
  

  def index
    @expenses = Expense.where(date: Date.today, user_id: current_user)
  end
  def new
    @item = current_user.expenses.new
  end
  def edit
    
  end
  def create
    @item = current_user.expenses.new(expense_params)
    @item.user = current_user
    
    if @item.save
        redirect_to expense_path(@item), flash: { success: "Expense is added successfully"} 
    else
         render 'new'
    end
  end

  def show
    
  end

 
  def update
    
      if @item.update(expense_params)
        redirect_to expense_path(@item), flash: {success: "Expense is updated successfully" }
      else
        render 'edit'
      end
  end

  def destroy
    if @item.destroy
      redirect_to expenses_path, flash: {success: "Expense was deleted" }
    else
      redirect_to expenses_path, flash: {danger: "Something went wrong" }
    end
  end
  
  def scoper 
    "expenses"
  end
  

  def update_expense_list
      if params[:c_name] != "0"
          if  params[:d_name] == "This year"
          @expense_with_duration =  Expense.where("date > ? AND date < ? AND user_id = ? AND category_id = ? ", Time.now.beginning_of_year, Time.now.end_of_year, current_user, params[:c_name] )
          end
          if  params[:d_name] == "This month"
          @expense_with_duration = Expense.where("date > ? AND date < ? AND user_id = ? AND category_id = ? ", Time.now.beginning_of_month, Time.now.end_of_month, current_user, params[:c_name] )
          end
          if params[:d_name] =="Today"
            @date = Date.today
            @expense_with_duration = Expense.where(category_id: params[:c_name] , date: @date )
          end
      else
          if  params[:d_name] == "This year"
          @expense_with_duration =  Expense.where("date > ? AND date < ? AND user_id = ?", Time.now.beginning_of_year, Time.now.end_of_year, current_user )
          end
          if  params[:d_name] == "This month"
          @expense_with_duration = Expense.where("date > ? AND date < ? AND user_id = ?", Time.now.beginning_of_month, Time.now.end_of_month, current_user)
          end
          if params[:d_name] =="Today"
           @date = Date.today
            @expense_with_duration = Expense.where(date: @date )
          end
      end
      sum #calling the action sum to find the sum of expenses in the duration
      respond_to do |format|
        format.html
        format.js       
      end  
  end

  def sum
    @sum = 0
      @expense_with_duration.each do |f|
        @sum = @sum+f.amount
      end
  end


  def validate_same_user
    @item = Expense.find(params[:id])
    redirect_to root_path, flash: {danger: "You can only delete or update your expenses" } if current_user != @item.user
  end


  
    def expense_params
      params.require(:expense).permit(:name,:amount,:date,:category_id)
    end

end


