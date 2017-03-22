Rails.application.routes.draw do
	resources :people
	put '/people/:id', to: 'people#update'
	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
