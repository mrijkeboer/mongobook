MongoBook::Application.routes.draw do

	root :to => 'sessions#new'

	match '/sign_in',  :to => 'sessions#new'
	match '/sign_out', :to => 'sessions#destroy'

	resources :sessions, :only => [:new, :create, :destroy]


	resources :contacts do
		collection do
			post 'search'
		end

		resources :addresses
		resources :emails
		resources :instant_messagings
		resources :phones
		resources :twitters
		resources :websites
	end

	resources :users

	match '/export/all', :to => 'export#all', :as => 'export'


end
