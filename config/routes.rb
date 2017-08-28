Rails.application.routes.draw do

  root to: "venues#index"

  namespace :users do
    resources :sessions, :only => [:new, :destroy, :create]
    get 'login' => 'sessions#new'
    get 'logout' => 'sessions#destroy'
  end

  namespace :venues do
    resources :sessions, :only => [:new, :destroy, :create]
    get 'login' => 'sessions#new'
    get 'logout' => 'sessions#destroy'
  end

  resources :venues do
    resources :promotions
  end

  get 'signup' => 'venues#new'
  resources :users


end
