 class ExpensesController < ApplicationController
	before_action :require_user
	before_action :require_same_user, only: [:edit, :update, :destroy, :show]
	before_action :set_value , only: [:edit, :show, :update, :destroy]

	def index
		@expenses = Expense.where(date: Date.today, user_id: current_user)
	end
	def new
		@expense = Expense.new
	end
	def edit
		
	end
	def create
		@expense = Expense.new(expense_params)
		@expense.user = current_user
		
		if @expense.save
				redirect_to expense_path(@expense), :flash => { :success => "Expense is added successfully"} 
		else
				# redirect_to new_expense_path
				 render action: :new
		end
	end

	def show
		
	end

 
	def update
		
			if @expense.update(expense_params)
				redirect_to expense_path(@expense), :flash => {:success => "Expense is updated successfully" }
		 	else
				render 'edit'
			end
	end

	def destroy
		@expense.destroy
		redirect_to expenses_path, :flash => {:danger => "Expense was deleted" }
	end

	def month
		@expenses = Expense.where("date > ? AND date < ? AND user_id = ?", Time.now.beginning_of_month, Time.now.end_of_month, current_user)
	end
	def year
		@expenses = Expense.where("date > ? AND date < ? AND user_id = ?", Time.now.beginning_of_year, Time.now.end_of_year, current_user)
	end
	
	def set_value
		@expense = Expense.find(params[:id])
	end



	def require_same_user
		@expense = Expense.find(params[:id])
		redirect_to root_path, :flash => {:danger => "You can only delete or update your expenses" } if current_user != @expense.user
		
	end


	
		def expense_params
			params.require(:expense).permit(:name,:amount,:date,:category_id)
		end

end


