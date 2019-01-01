class AddCategoryToExpenses < ActiveRecord::Migration[5.2]
  def change
  	add_column :expenses, :category, :string
  end
end
