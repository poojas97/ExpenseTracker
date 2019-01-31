class DropRecurringExpenses < ActiveRecord::Migration[5.2]
  def change
  	 drop_table :recurring_expenses
  end
end
