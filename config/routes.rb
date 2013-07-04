Bookmark::Application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  root :to => 'pages#index'
  resources :topics

  resources :items do
    resources :comments
  end
end
