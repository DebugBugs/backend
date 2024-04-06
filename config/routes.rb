Rails.application.routes.draw do
  resources :users, only: [:show, :destroy, :index]
  get 'users/:id/use-energy', to: 'users#use_energy'
  post 'signup', to: 'users#create'
  post 'login', to: 'users#login'
end
