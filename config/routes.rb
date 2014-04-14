OverflowClone::Application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root to: "users#new"
  resources :sessions, :only => [:new, :create, :destroy]
  resources :users
end
