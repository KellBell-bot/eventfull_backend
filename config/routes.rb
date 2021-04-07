Rails.application.routes.draw do
  resources :calendar_events
  resources :events
  resources :users

  post '/signup', to: 'users#create'
  post '/login', to: 'auth#login'
  get '/auto_login', to: 'auth#auto_login'
  
end
