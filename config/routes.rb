Rails.application.routes.draw do
root 'static#home'


resources :cocktails, only: [:index, :show, :create]

resources :users, except: [:index, :show, :signup]
get '/signup', to: 'users#new', as: 'signup'

resources :users, only: [:show, :destroy] do
  resources :cocktails, only: [:show, :new, :create, :edit, :update, :destroy]
  get '/profile', to: 'users#profile'
end

# post '/users/:user_id/cocktails/new', to: 'cocktails#new'
get '/login', to: 'sessions#new'
post '/session', to: 'sessions#create', as: 'session'
get "/logout", to: "sessions#logout", as: "logout"

end 

