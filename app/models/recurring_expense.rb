class RecurringExpense < ApplicationRecord
	belongs_to :user

	validates :name, presence: true, length: { minimum: 3, maximum: 25 }
	validates_uniqueness_of :name
	validates :duration , presence: true
	validates_date :date, presence: true
	
end
