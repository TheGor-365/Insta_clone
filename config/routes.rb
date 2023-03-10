Rails.application.routes.draw do

  devise_for :persons
  root to: "public#homepage"

  get '/dashboard' => 'persons#index'
  get 'profile/:username' => 'persons#profile', as: :profile
  get 'post/like/:post_id' => 'likes#save_like', as: :like_post

  post 'follow/person' => 'persons#follow_person', as: :follow_person

  resources :posts, only: [:new, :create, :show]
  resources :comments, only: [:create]

end
