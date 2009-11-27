ActionController::Routing::Routes.draw do |map|

	map.root :controller => 'welcome'
	map.sign_in 'welcome/sign_in', :controller => 'welcome', :action => 'sign_in'
	map.sign_out 'welcome/sign_out', :controller => 'welcome', :action => 'sign_out'
	
	map.resources :people, :collection => { :search => :post } do |person|
		person.resources :addresses
		person.resources :contact_methods
	end

	map.resources :users

	map.export 'export/all', :controller => 'export', :action => 'all'
end
