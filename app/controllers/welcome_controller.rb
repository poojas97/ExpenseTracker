class WelcomeController < ApplicationController
  
  def home
     redirect_to expenses_path if logged_in?
  end
  
end