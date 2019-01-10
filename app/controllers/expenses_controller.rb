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
		
		if @expense.save
				# flash[:success] = "Expense is added successfully"
				redirect_to expense_path(@expense), :flash => { :success => "Expense is added successfully"} 
		else
				render 'new'
		end
	end

	def show
		@expense = Expense.find(params[:id])
	end

 
	def update
		@expense = Expense.find(params[:id])
			if @expense.update(expense_params)
				redirect_to expense_path(@expense), :flash => {:success => "Expense is updated successfully" }
		 	else
				render 'edit'
			end
	end

	def destroy
			@expense = Expense.find(params[:id])
			@expense.destroy
			
			redirect_to expenses_path, :flash => {:danger => "Expense was deleted" }
	end

	def month
		@expenses = Expense.where("date > ? AND date < ? AND user_id = ?", Time.now.beginning_of_month, Time.now.end_of_month, current_user)
	end
	def year
		@expenses = Expense.where("date > ? AND date < ? AND user_id = ?", Time.now.beginning_of_year, Time.now.end_of_year, current_user)
	end
	def require_same_user
		@expense = Expense.find(params[:id])
		redirect_to root_path, :flash => {:danger => "You can only delete or update your expenses" } if current_user != @expense.user
		
	end


	
		def expense_params
			params.require(:expense).permit(:name,:amount,:date,:category_id)
		end

end


