Rails.application.routes.draw do
  get "sign_in" => "user/sessions#new"
  delete "sign_out" => "user/sessions#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :user do
    resources :registrations, only: [:new, :create]
    resources :sessions, only: :create
  end
  resources :users, only: [:index]
end
