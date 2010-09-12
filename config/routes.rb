MongoBook::Application.routes.draw do

	root :to => 'welcome#index'

	match '/sign_in',  :to => 'welcome#sign_in'
	match '/sign_out', :to => 'welcome#sign_out'

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


  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

end
