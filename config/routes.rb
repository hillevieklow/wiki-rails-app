Rails.application.routes.draw do
  get '/login' => 'application#welcome'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  
  resources :articles
  resources :users
  root 'application#welcome', as: :welcome
end
