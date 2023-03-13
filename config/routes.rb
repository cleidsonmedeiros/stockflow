Rails.application.routes.draw do
  devise_for :users
  
  resources :products do
    resources :movements, only: [:new, :create]
  end
  
  root to: 'products#index'
end
