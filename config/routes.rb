Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  root 'home#top'
  get 'home/about'
  get 'questions/number'
  resources :questions do
    resources :ratings, only: [:create, :edit, :update, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update] do
    resources :comments, only: [:create, :update, :destroy]
    member do
      get :following, :followers, :questions, :favorites, :messages
    end
  end
  resources :relationships, only: [:create, :destroy]
  get 'withdraw/confirm' => "withdraw#confirm"
  patch 'withdraw' => "withdraw#update"
end
