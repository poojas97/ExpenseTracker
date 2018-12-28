require "date"

class Expense <ActiveRecord::Base
	validates :expense_name, presence: true, length: { minimum: 3, maximum: 50} 
	validates :amount, presence: true
    # validates_date :date, presence: true, on_or_before: lambda { Date.current }
    #validates :date, timeliness: { on_or_before: lambda { Date.current }, type: :date }
    # validates  :date , date: true
    validates_date :date, :on_or_before => lambda { Date.today}
  #   validate :happened_at_is_valid_datetime

  # def happened_at_is_valid_datetime
  #    if !date.is_a?(Date)
  #     errors.add(:date, 'must be a valid date') 
  #   end
  # end

end