Rails.application.routes.draw do
  resources :articles do
    resources :comment, except: :get
  end
  resources :comment, except: :get
  post 'authenticate', to: 'authentication#authenticate'
  post 'register', to: 'authentication#register'
  post 'article/comment', to: 'comment#index'
end
