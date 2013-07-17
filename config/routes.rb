Bookmark::Application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  authenticated :user do
    root :to => 'topics#all_topics'
  end
  unauthenticated :user do
  devise_scope :user do
    get "/" => 'pages#index'
  end
end

get '/topics' => "topics#all_topics"
get '/items' => "items#all_items"


  resources :memberships
  resources :groups do
    resources :topics
    resources :users
    resources :items do
      resources :comments
    end
  end
end
