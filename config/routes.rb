Rails.application.routes.draw do
  get 'sessions/new'
  resources :users
  
  get 'users/new'
  
  # Basic site navigation
  get '/help',     to: 'static_pages#help', as: 'help'
  get '/about',    to: 'static_pages#about'
  get '/contact',  to: 'static_pages#contact'
  get '/signup',   to: 'users#new'

  # User Session routes
  get '/login',    to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  # Defines the root path route ("/")
  root "static_pages#home"
end
