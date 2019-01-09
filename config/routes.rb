Rails.application.routes.draw do
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root 'welcome#home'
	get '/expenses/year' => 'expenses#year'
	get '/expenses/month' => 'expenses#month'
	resources :expenses

	resources :categories, except: [:destroy]
	get 'signup', to: 'users#new' 
	resources :users, except: [:new]
	get 'login', to:'sessions#new'
	post 'login' , to: 'sessions#create'
	delete 'logout', to: 'sessions#destroy'
end
