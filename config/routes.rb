Rails.application.routes.draw do
  resources :articles
  resources :comment
  post 'authenticate', to: 'authentication#authenticate'
  post 'register', to: 'authentication#register'
end
