Rails.application.routes.draw do
  resources :customers
  resources :customer_preferences
  resources :pets
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
