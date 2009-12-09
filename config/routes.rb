ActionController::Routing::Routes.draw do |map|

	map.root :controller => 'welcome'
	map.sign_in 'welcome/sign_in', :controller => 'welcome', :action => 'sign_in'
	map.sign_out 'welcome/sign_out', :controller => 'welcome', :action => 'sign_out'
	
	map.resources :contacts, :collection => { :search => :post } do |contact|
		contact.resources :addresses
		contact.resources :emails
		contact.resources :instant_messagings
		contact.resources :phones
		contact.resources :twitters
		contact.resources :websites
	end

	map.resources :users

	map.export 'export/all', :controller => 'export', :action => 'all'
end
