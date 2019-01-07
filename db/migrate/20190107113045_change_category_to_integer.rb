class ChangeCategoryToInteger < ActiveRecord::Migration[5.2]
  def change
      change_column :expenses, :category, :integer

  end
end
