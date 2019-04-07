Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'profile_edit', to: 'users/registrations#profile_edit', as: 'profile_edit'
    patch 'profile_update', to: 'users/registrations#profile_update', as: 'profile_update'
  end
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
