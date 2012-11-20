Tastell::Application.routes.draw do

  root to: "authentications#new"

  resources :places, only: [:index, :show]
  resources :orders, only: [:index, :new, :create] do
    get :check, on: :member
  end
  resources :users, only: [:index]
  resources :authentications, only: [:new, :create]


  namespace :account do
    resources :places do
      get :description, on: :member

      resources :photos, only: [:index, :create, :destroy]
    end
  end

end
