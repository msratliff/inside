Rails.application.routes.draw do
  namespace :users do
    get 'sessions/new'
  end

  namespace :venues do
    get 'login' => 'sessions#new'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "venues#index"

  resources :venues do
    resources :promotions
  end


end
