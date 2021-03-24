Rails.application.routes.draw do
  resources :calendar_events
  resources :events
  resources :users

  post '/login', to: 'auth#login'
  get '/route', to: 'auth#persist'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
