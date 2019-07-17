Rails.application.routes.draw do
  resources :articles do
    resources :comment, except: :get
  end
  resources :comment, except: get
  post 'authenticate', to: 'authentication#authenticate'
  post 'register', to: 'authentication#register'
  get 'articles/:article_id/comment', to: 'articles#get_comments'
end
