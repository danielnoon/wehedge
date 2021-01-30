Rails.application.routes.draw do
  get 'users/new'
  post 'users/login'

  # get all tags
  get 'tags/index'
end
