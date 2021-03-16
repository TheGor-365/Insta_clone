Rails.application.routes.draw do

  devise_for :accounts, controllers: { omniauth_callbacks: 'accounts/omniauth_callbacks' }
  root to: "public#homepage"

  get '/dashboard' => 'accounts#index'
  get 'profile/:username' => 'accounts#profile', as: :profile
  get 'post/like/:post_id' => 'likes#save_like', as: :like_post

  post 'follow/account' => 'accounts#follow_account', as: :follow_account

  resources :posts, only: [:new, :create, :show]
  resources :comments, only: [:create]

end
