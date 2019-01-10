class ChangeExpenseNameToExpense < ActiveRecord::Migration[5.2]
  def change
  	rename_column :expenses, :expense_name, :name
  	rename_column :categories, :category_name, :name
  end
end
