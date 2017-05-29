Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :committees do
  	resources :users do
  		resources :payees
  	end
  	resources :instalments
  end
end
