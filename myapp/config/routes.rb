Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :questions
  resources :subgeneres
  resources :generes
  get 'sessions/new'
  post 'userans/add'
  post 'questions/check'
  get 'user/list'
  post 'adduser' , to: 'user#create'
  get 'user/new'
  get 'pages/index'
  get 'profile' , to: 'pages#show'
  get 'login' , to: 'sessions#new'
  delete 'logout' , to: 'sessions#destroy'
  post 'login' , to: 'sessions#create'
  root 'pages#index'
  get 'destroy' , to: 'user#destroy'
  get 'subgen/:id' , to: 'subgeneres#leader'
  get 'led/:id' , to: 'led#leader'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
