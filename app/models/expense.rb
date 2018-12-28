class Expense <ActiveRecord::Base
	validates :expense_name, presence: true, length: { minimum: 3, maximum: 50} 
	validates :amount, presence: true
    # validates_date :date, presence: true, on_or_before: lambda { Date.current }
    #validates :date, timeliness: { on_or_before: lambda { Date.current }, type: :date }


end