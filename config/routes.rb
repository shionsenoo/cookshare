Rails.application.routes.draw do  
  devise_for :users
  root to: "home#index"
  resources :users, only:[:index, :show, :edit, :update]
  resources :posts do
    resources :comments, only: :create
  end
end
