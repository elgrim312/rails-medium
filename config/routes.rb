Rails.application.routes.draw do
  resources :articles
  post 'authenticate', to: 'authentication#authenticate'
  post 'register', to: 'authentication#register'
end
