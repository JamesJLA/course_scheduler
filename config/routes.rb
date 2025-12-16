Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root "dashboard#index", as: :authenticated_root
  end

  root "dashboard#index"

  get "/dashboard", to: "dashboard#index"

  resources :courses
  resources :users, only: [ :index, :show ]
  resources :enrollments, only: [ :create, :destroy ]
end
