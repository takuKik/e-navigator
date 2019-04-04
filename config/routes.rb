Rails.application.routes.draw do
  root 'users#index'
  devise_for :users
  resources :users do
    resources :interviews do
      member do
        patch :setup
      end
    end
  end
end
