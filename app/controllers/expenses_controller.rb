 class ExpensesController < ApplicationController
 	def index
 		#@expenses = Expense.all
 		 @expenses = Expense.where(date: Date.today)
    
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
      @expense.user = User.first
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



 	
		def expense_params
			params.require(:expense).permit(:expense_name,:amount,:date)
		end

end


