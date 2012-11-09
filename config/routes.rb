Tastell::Application.routes.draw do

  resources :places, only: [:index, :show]
  resources :orders, only: [:index, :new, :create]
  resources :users, only: [:index]
  resources :authentications, only: [:new, :create]

end
