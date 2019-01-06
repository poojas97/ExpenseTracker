 class ExpensesController < ApplicationController
 	before_action :require_user
   before_action :require_same_user, only: [:edit, :update, :destroy, :show]

   def index
 		#@expenses = Expense.all
 		 @expenses = Expense.where(date: Date.today, user_id: current_user)
    
 	end
 	def new
 		@expense = Expense.new
 	end
 	  def edit
   		@expense = Expense.find(params[:id])
   end
 	def create
 		#render plain: params[:expense].inspect
 		@expense = Expense.new(expense_params)
      @expense.user = current_user
      	if	@expense.save
      	  flash[:success] = "Expense is added successfully"
 		  redirect_to expense_path(@expense)
 	    else
 		  render 'new'
 		end
 	end

   def show
   	@expense = Expense.find(params[:id])
   end

 
   def update
   	@expense = Expense.find(params[:id])
      	if	@expense.update(expense_params)
      	  flash[:success] = "Expense is updated successfully"
 		  redirect_to expense_path(@expense)
 	    else
 		  render 'edit'
 		end

   end

   def destroy
   		@expense = Expense.find(params[:id])
   		@expense.destroy
   		flash[:danger] = "Expense was deleted"
   		redirect_to expenses_path
   end

   def month
       @expenses = Expense.where("date > ? AND date < ?", Time.now.beginning_of_month, Time.now.end_of_month)
   end
   def require_same_user
      # @expense = Expense.find(params[:id])
      if current_user != User.where(@expense)
         flash[:danger] = "You can only delete or update your expenses"
         redirect_to root_path
      end
   end


 	
		def expense_params
			params.require(:expense).permit(:expense_name,:amount,:date,:category)
		end

end


