Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  # get '/expenses/year' => 'expenses#year'
  # get '/expenses/month' => 'expenses#month'
  get "/expenses/new_release" => 'expenses#new_release', :as => :new_release
  get "expenses/update_expense_list" => 'expenses#update_expense_list', as: "update_expense_list"
  resources :expenses
  resources :recurring_expenses
  resources :categories
  get 'signup', to: 'users#new' 
  resources :users, except: [:new]
  get 'login', to:'sessions#new'
  post 'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
