Tastell::Application.routes.draw do

  root to: 'places#index'

  match '/auth/:provider/callback', to: 'authentications#create'

  resources :places, only: [:index, :show]
  resources :orders, only: [:create] do
    get :check, on: :member
  end

  resources :users, only: [:index]
  resource :profile, only: [:show, :edit, :update]
  resources :authentications, only: [:new, :create]


  namespace :account do
    resources :places do
      get :description, on: :member

      resources :photos, only: [:index, :create, :destroy]
    end
  end

end
