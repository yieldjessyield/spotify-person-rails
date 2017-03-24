Rails.application.routes.draw do
	put '/people', to: 'people#update'
	resources :people
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
