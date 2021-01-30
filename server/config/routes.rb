Rails.application.routes.draw do

  resources :groups, only: %i[index show create]
  # get 'groups/index'
  # get 'groups/create'
  # get 'groups/show'
  post 'users/new'
  post 'users/login'

  # get all tags
  get 'tags/index'
end
