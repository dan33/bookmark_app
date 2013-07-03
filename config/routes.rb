Bookmark::Application.routes.draw do

  root :to => 'pages#index'
  resources :topics

  resources :items do
    resources :comments
  end
end
