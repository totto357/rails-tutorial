Rails.application.routes.draw do
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
  post "/logout", to: "sessions#destroy"

  # ユーザ情報
  resources :users
end
