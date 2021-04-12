Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'sessions#new'

  get 'log_out', to: 'sessions#destroy', as: 'log_out'
  get 'log_in', to: 'sessions#new', as: 'log_in'
  get 'sign_up', to: 'users#new', as: 'sign_up'
  match 'sessions', to: 'sessions#create', via: :post

  resources :orders
end
