Rails.application.routes.draw do
  get 'diaries/index'
  root "homes#index"
  get "homes/show"
  resource :profiles, only: [:edit, :update]
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
