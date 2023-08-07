Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get "home/about" => "homes#about", as: 'about'

  resources :books, only: [:index, :create, :show, :edit, :update, :destroy] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :update, :edit] do
    resource :relationships, only: [:create, :destroy]
    get "followers" => "relationships#followers", as: "followers"
    get "following" => "relationships#following", as: "following"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
