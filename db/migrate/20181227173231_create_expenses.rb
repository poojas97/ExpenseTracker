class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
    	t.string :name
    	t.float :amount
    	t.date :date
    	t.integer :category_id
    	t.integer :user_id
    	t.timestamps


    	

    end
  end
end
