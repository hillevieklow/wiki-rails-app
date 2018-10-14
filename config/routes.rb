Rails.application.routes.draw do
  resources :articles
  root 'application#welcome', as: :welcome
end
