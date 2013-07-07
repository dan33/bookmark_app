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
  resources :memberships
  resources :users
  resources :groups
  resources :topics
  resources :items do
    resources :comments
  end

  get '/profile' => 'users#profile'
end
