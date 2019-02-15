Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  get "sessions/new"
  root "static_pages#home"

  get "/home", to: "static_pages#home"
  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"

  # ユーザ新規作成
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"

  # ログイン
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  # ユーザ情報
  resources :users

  # アカウントの有効化
  resources :account_activations, only: [:edit]

  # パスワードリセット
  resources :password_resets, only: [:new, :create, :edit, :update]
end
