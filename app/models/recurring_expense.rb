class RecurringExpense < ApplicationRecord
	belongs_to :user

	validates :name, presence: true, length: { minimum: 3, maximum: 25 }
	validates_uniqueness_of :name
	validates :duration , presence: true
	validates_date :date, presence: true

# enum duration: { daily: 0, weekly: 1, biweekly: 2, monthly: 3, annually: 4 }

# 	 def schedule
#     @schedule ||= begin
#       schedule = IceCube::Schedule.new(now = start_date)
#       case duration
#       when 'daily'
#       	schedule.add_recurrence_rule IceCube::Rule.daily    
#       when 'weekly'
#       	schedule.add_recurrence_rule IceCube::Rule.weekly
#       when 'biweekly'
#         schedule.add_recurrence_rule IceCube::Rule.weekly(2)
#       when 'monthly'
#         schedule.add_recurrence_rule IceCube::Rule.monthly(1)
#       when 'annually'
#         schedule.add_recurrence_rule IceCube::Rule.yearly(1)
#       end
#       schedule
#     end
#   end
	
end
