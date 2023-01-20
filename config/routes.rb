Rails.application.routes.draw do
  # Tasks
  get '/tasks', to: 'tasks#index'
  post '/tasks', to: 'tasks#create'
  delete '/tasks/:id', to: 'tasks#destroy'
  patch '/tasks/:id', to: 'tasks#update'
  
  # Users and Sesssions
  get '/users', to: 'registrations#index'
  post '/signup', to: 'registrations#create'
  
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
end
