OverflowClone::Application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root to: "posts#index"
  resources :sessions, :only => [:new, :create, :destroy]
  resources :users

  resources :posts do
    resources :answers, :only => [:new, :create]
  end

  resources :answers, :only => [:destroy, :edit, :update]

end
