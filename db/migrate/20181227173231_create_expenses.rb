class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
    	t.string :expense_name
    	t.float :amount
    	t.date :date
    	t.timestamps

    end
  end
end
