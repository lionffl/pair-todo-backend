Rails.application.routes.draw do
  # Tasks
  get '/tasks', to: 'tasks#index'
  post '/tasks', to: 'tasks#create'
  delete '/tasks/:id', to: 'tasks#destroy'
  patch '/tasks/:id', to: 'tasks#update'
  
  # Users
  get '/users', to: 'users#index'
  post '/signup', to: 'users#create'
  post '/signin', to: 'login#create'
end
