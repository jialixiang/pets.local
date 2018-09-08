Rails.application.routes.draw do
  resources :adoptions
  resources :customers

  resources :pets
  get '/pets/:id/matches', action: :matches, controller: 'pets'
end
