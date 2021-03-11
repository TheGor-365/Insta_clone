Rails.application.routes.draw do

  devise_for :accounts
  root to: "public#homepage"

  # devise_for :accounts, controllers: { omniauth_callbacks: 'accounts/omniauth_callbacks' }

  get '/dashboard' => 'accounts#index'
  get 'profile/:username' => 'accounts#profile', as: :profile
  get 'post/like/:post_id' => 'likes#save_like', as: :like_post

  post 'follow/account' => 'accounts#follow_account', as: :follow_account

  resources :posts, only: [:new, :create, :show]
  resources :comments, only: [:create]

  devise_scope :account do
    get "/accounts/sign_out" => "devise/sessions#destroy"
  end

end
