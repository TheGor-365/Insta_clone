Rails.application.routes.draw do

  devise_for :owners
  root to: "public#homepage"

  get '/dashboard' => 'owners#index'
  get 'profile/:username' => 'owners#profile', as: :profile
  get 'article/like/:article_id' => 'likes#save_like', as: :like_article

  post 'follow/owner' => 'owners#follow_owner', as: :follow_owner

  resources :articles, only: [:new, :create, :show]
  resources :comments, only: [:create]

end
