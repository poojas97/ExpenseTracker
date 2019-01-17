class RecurringExpenses < ActiveRecord::Migration[5.2]
  def change
  	 create_table :recurring_expenses do |t|
  	t.string :name
  	t.string :duration
  	t.integer :user_id
  	t.date :reminder_date
  end
  end
end
