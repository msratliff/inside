Rails.application.routes.draw do

  root to: "venues#index"

  namespace :users do
    resource :sessions, :only => [:new, :destroy, :create]
    get 'login' => 'sessions#new'
    get 'logout' => 'sessions#destroy'
  end

  namespace :venues do
    resource :sessions, :only => [:new, :destroy, :create]
    get 'login' => 'sessions#new'
    get 'logout' => 'sessions#destroy'
  end

    resources :venues do
    resources :promotions
  end

  resource :users

  

end
