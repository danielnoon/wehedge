Rails.application.routes.draw do

  get 'members/index'
  get 'members/create'
  get 'members/destroy'
  resources :groups, only: %i[index show create] do
    resources :members, only: %i[index create destroy]
  end
  # get 'groups/index'
  # get 'groups/create'
  # get 'groups/show'
  post 'users/new'
  post 'users/login'

  # get all tags
  get 'tags/index'
end
