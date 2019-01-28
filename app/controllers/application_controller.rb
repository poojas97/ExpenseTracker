class ApplicationController < ActionController::Base


  protect_from_forgery prepend: true, with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    current_user.present?
  end
  
  def validate_user
     redirect_to root_path,flash: {danger: "You must be logged in" } unless logged_in?
  end
 
  def scope
    @items = current_user.send(scoper).find(params[:id])
  end


  # def notify
  #   @rec = RecurringExpense.all
  #   @rec.each do |d|
  #     if d.reminder_date == Date.today
  #       # redirect_to new_expense_path
  #       flash[:alert] = "add the expense #{d.name}"

  #     end
  #   end
  # end

end
