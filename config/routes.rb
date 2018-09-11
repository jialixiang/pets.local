Rails.application.routes.draw do
  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  resources :adoptions

  resources :customers
  get '/customers/:id/matches', action: :matches, controller: 'customers'
  post '/customers/:id/adopt', action: :adopt, controller: 'customers'

  resources :pets
  get '/pets/:id/matches', action: :matches, controller: 'pets'
end
