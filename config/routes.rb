Rails.application.routes.draw do

  root to: "venues#index"
  get 'auth/:provider/callback' => 'users/sessions#create'
  

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
  resources :charges, only: [:new, :create, :index, :show]
  patch '/charges/:id/confirm', :to => 'charges#toggle_active', :as => 'confirm_transaction'

  get 'venues/:id/analytics' => 'venues#analytics', as: 'analytics'
  get 'venues/signup' => 'venues#new'
  get 'users/signup' => 'users#new'

  get 'auth/facebook', as: 'facebook_login'



end
