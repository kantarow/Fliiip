Rails.application.routes.draw do
  root 'static_pages#home'
  get '/auth/:provider/callback', to: 'session#create'
  delete 'logout', to: 'session#destroy'
  resources :users
end
