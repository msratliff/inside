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

<<<<<<< HEAD
=======
  get 'venues/signup' => 'venues#new'
  get 'users/signup' => 'users#new'
>>>>>>> 0282773a50f9a21523a5fb22512802af4b7d1aa4
  

end
