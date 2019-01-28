namespace :notify do
	task :weekly => :environment do
		# puts "hello"
		# expense = RecurringExpense.find_by_duration("weekly")
		 @expense = RecurringExpense.all
		puts "#{@expense.name}"
		
		@expense.each do |call|
			if call.duration = "weekly"
				d = call.reminder_date
				system "notify-send 'Expense' 'add #{call.name}' -t 2000"
			    # Rails.logger.info "hi"
	       		call.reminder_date = (d+7).to_s
	       		call.save
	     	end
    	end
	end
	# task :monthly => :environment do
	# 	# puts "hello"
	# 	# expense = RecurringExpense.find_by_duration("weekly")
	# 	 @expense = RecurringExpense.all
	# 	puts "#{@expense.name}"
		
	# 	@expense.each do |call|
	# 		if call.duration = "monthly"
	# 			d = call.reminder_date
	# 			 "notify-send 'Expense' 'add #{call.name}' -t 2000"
	#        		call.reminder_date = (d+7).to_s
	#        		call.save
	#      	end
 #    	end
	# end
	# task :yearly => :environment do
	# 	# puts "hello"
	# 	# expense = RecurringExpense.find_by_duration("weekly")
	# 	 @expense = RecurringExpense.all
	# 	puts "#{@expense.name}"
		
	# 	@expense.each do |call|
	# 		if call.duration = "monthly"
	# 			d = call.reminder_date
	# 		   "notify-send 'Expense' 'add #{call.name}' -t 2000"
	#        		call.reminder_date = (d+7).to_s
	#        		call.save
	#      	end
 #    	end
	# end

end

     	