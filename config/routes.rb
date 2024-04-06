Rails.application.routes.draw do
  resources :users, only: [:show, :destroy, :index]
  post 'signup', to: 'users#create'
  post 'login', to: 'users#login'
end
