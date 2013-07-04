Bookmark::Application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  authenticated :user do
    root :to => 'groups#show'
  end
  unauthenticated :user do
  devise_scope :user do
    get "/" => 'pages#index'
  end
end

  get '/users' => 'users#index'
  get '/users/:id' => 'users#show'
  resources :topics
  resources :items do
    resources :comments
  end
end
