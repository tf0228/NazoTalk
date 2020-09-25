Rails.application.routes.draw do
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
  resources :questions
  resources :users, only: [:index, :show]
  get 'users/:id/following' => "users#following"
  get 'users/:id/followers' => "users#followers"
  get 'withdraw/confirm'
  patch 'withdraw' => "withdraw#update"
end
