Rails.application.routes.draw do
root 'static#home'


resources :cocktails, only: [:index, :show, :create, :edit]

resources :users, except: [:index, :signup]
get '/signup', to: 'users#new', as: 'signup'

resources :users, only: [:show] do
  resources :cocktails, only: [:new, :create, :edit, :update, :destroy]
  get '/profile', to: 'users#profile'
end


get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'
get "/logout", to: "sessions#logout", as: "logout"
post "/users/:id", to: "users#destroy", as: "delete_user"

# match '/auth/:facebook/callback' => 'sessions#facebook', via: [:get, :post]

match '/auth/:google_oauth2/callback' => 'sessions#google', via: [:get, :post]

end 

