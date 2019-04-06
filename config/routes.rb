Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "companies#index"
  resources :companies do
    resources :reviews, only: %i[create], module: :companies
  end
  resources :users, only: %i[show]

  namespace :my_pages do
    resources :reviews, only: %i[index edit update destroy]
  end
end
