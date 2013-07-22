Bookmark::Application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  authenticated :user do
    root :to => 'groups#index'
  end
  unauthenticated :user do
  devise_scope :user do
    get "/" => 'pages#index'
  end
end

  resources :memberships
  resources :groups do
    resources :topics
    resources :users
    resources :items do
      resources :comments
    end
  end
end
