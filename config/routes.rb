Bookmark::Application.routes.draw do
  root :to => 'pages#index'
  resources :topics
  resources :items
end
