Rails.application.routes.draw do
  resources :articles
  post 'authenticate', to: 'authentication#authenticate'
end
