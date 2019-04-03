Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/login', to: 'auth#login'
      get '/user', to: 'users#show_user'
      resources :users
      resources :orders
      resources :pizza_types
      resources :order_items
    end
  end
end
