class RecurringExpensesController < ApplicationController
	def index
			@rec_expense = RecurringExpense.where( user_id: current_user)
	end

	def new
		@rec_expense = RecurringExpense.new
	end

	def create
		#render plain: params[:expense].inspect
		@rec_expense = RecurringExpense.new(expense_params)
		@rec_expense.user = current_user
		
		if @rec_expense.save
				# flash[:success] = "Expense is added successfully"
				redirect_to recurring_expense_path(@rec_expense), :flash => { :success => "Expense is added successfully"} 
		else
				# render '/shared/errors' , obj: @expense
				# redirect_to new_expense_path

				 render action: :new
		end
	end

	def show
		@rec_expense = RecurringExpense.find(params[:id])
	end

 
	def update
		@rec_expense = RecurringExpense.find(params[:id])
			if @expense.update(expense_params)
				redirect_to recurring_expense_path(@rec_expense), :flash => {:success => "Expense is updated successfully" }
		 	else
				render 'edit'
			end
	end

	def destroy
			@rec_expense = RecurringExpense.find(params[:id])
			@rec_expense.destroy
			
			redirect_to recurring_expenses_path, :flash => {:danger => "Expense was deleted" }
	end

	def expense_params
			params.require(:recurring_expense).permit(:name,:duration,:reminder_date)
		end

end