Rails.application.routes.draw do
  root 'static_pages#home'
  get '/auth/:provider/callback', to: 'session#create'
  delete 'logout', to: 'session#destroy'
  get '/login', to: 'session#new'
  resources :users
end
