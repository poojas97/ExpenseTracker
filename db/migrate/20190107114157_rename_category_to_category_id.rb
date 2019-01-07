class RenameCategoryToCategoryId < ActiveRecord::Migration[5.2]
  def change
  	 rename_column :expenses, :category, :category_id
  end
end
