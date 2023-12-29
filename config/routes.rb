Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:index, :new, :create, :show]

end
