Rails.application.routes.draw do
  resources :teams
  get "pages/home"
  get "lobby", to: "pages#lobby"
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check
  root "pages#home"

  delete "my_team", to: "user_team#destroy", as: :leave_team
end
