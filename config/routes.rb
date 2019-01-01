Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/expenses/month' => 'expenses#month'
  resources :expenses

  resources :categories, except: [:destroy]



end
