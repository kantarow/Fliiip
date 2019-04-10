Rails.application.routes.draw do
  root 'static_pages#home'
  get 'session/new'
  get 'session/create'
  get 'login', to: 'session#new'
  post 'login', to: 'session#create'
  delete 'logout', to: 'session#destroy'
  resources :users
end
