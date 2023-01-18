Rails.application.routes.draw do
  # Tasks
  get '/tasks', to: 'tasks#index'
  post '/tasks', to: 'tasks#create'
  delete '/tasks/:id', to: 'tasks#destroy'
  patch '/tasks/:id', to: 'tasks#update'
  
  # Users and Sessions
  get '/users', to: 'users#index'
  post '/signup', to: 'users#create'
  post '/signin', to: 'sessions#create'
  post 'signout', to: 'sessions#destroy'
end
