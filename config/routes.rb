Tastell::Application.routes.draw do

  root to: "authentications#new"

  resources :places, only: [:index, :show]
  resources :orders, only: [:index, :new, :create]
  resources :users, only: [:index]
  resources :authentications, only: [:new, :create]

end
