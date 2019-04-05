Rails.application.routes.draw do
  resources :addresses
  namespace :api do
    namespace :v1 do
      post '/login', to: 'auth#login'
      get '/user', to: 'users#show_user'
      resources :users
      resources :orders
      resources :pizza_types
      resources :order_items
      resources :addresses
    end
  end
end
