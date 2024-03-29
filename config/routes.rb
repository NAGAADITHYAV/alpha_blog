Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'articles#index'
  resources :articles

  get 'signup', to: 'users#new'
  # post 'users', to: 'users#create'
  resources :users, except: [:new]
end
