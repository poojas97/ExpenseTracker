require "date"
class Expense <ActiveRecord::Base
	belongs_to :user
	belongs_to :category

	validates :expense_name, presence: true, length: { minimum: 3, maximum: 50} 
	validates :amount, presence: true
	validates_date :date, :on_or_before => lambda { Date.today}
	validates :user_id, presence: true
	validates :category_id, presence: true
end