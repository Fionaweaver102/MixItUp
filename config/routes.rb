Rails.application.routes.draw do
root 'static#home'


resources :cocktails, only: [:index, :show, :create, :edit]

resources :users, except: [:index, :show, :signup]
get '/signup', to: 'users#new', as: 'signup'

resources :users do
  resources :cocktails, only: [:new, :create, :edit, :update, :destroy]
  get '/profile', to: 'users#profile'
end

# patch 'users/:id/cocktails', to: 'cocktails#edit'

# post '/users/:user_id/cocktails/new', to: 'cocktails#new'
get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'
get "/logout", to: "sessions#logout", as: "logout"

end 

