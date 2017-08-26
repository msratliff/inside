Rails.application.routes.draw do
  
  namespace :users do
    get 'sessions/new'
  end

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

  resource :users
  

end
