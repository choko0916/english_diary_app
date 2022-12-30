Rails.application.routes.draw do
  devise_for :users
  root "homes#index"
  get "homes/show"
  devise_for :users, controllers: {
    registrations: "users/registration",
    sessions: "users/sessions"
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
