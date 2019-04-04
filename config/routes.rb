Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "companies#index"
  resources :companies do
    resources :reviews, module: :companies
  end
  resources :users, only: [:show]
end
