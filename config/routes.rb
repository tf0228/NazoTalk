Rails.application.routes.draw do
  get 'ratings/create'
  get 'ratings/update'
  get 'ratings/destroy'
  devise_for :users
  root 'home#top'
  get 'home/about'
  resource :mypage, only: [:edit, :update]
  get 'mypage/info'
  get 'mypage/following'
  get 'mypage/followers'
  get 'mypage/questions'
  get 'mypage/favorites'
  get 'mypage/messages'
  resources :questions do
    resources :ratings, only: [:create, :edit, :update, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show]
  resources :relationships, only: [:create, :destroy]
  get 'users/:id/following' => "users#following"
  get 'users/:id/followers' => "users#followers"
  get 'withdraw/confirm'
  patch 'withdraw' => "withdraw#update"
end
