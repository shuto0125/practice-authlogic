Rails.application.routes.draw do
  get "sign_in" => "user/sessions#new"
  delete "sign_out" => "user/sessions#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :user do
    resources :registrations, only: [:new, :create]
    resources :sessions, only: :create
    get "mail_activate/:activate_code",
        controller: "mail_activate",
        action: "create", as: "mail_activate"
    resources :password_resets, onlye: [:new, :create, :edit, :update]
  end
  resources :users, only: [:index]
end
