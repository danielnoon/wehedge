Rails.application.routes.draw do

  get 'tags/index', to: 'tags#all_index'

  resources :groups, only: %i[index show create] do
    resources :members, only: %i[index create destroy]
    resources :tags, only: %i[index create destroy]
    resources :picks, only: %i[index show create destroy] do
      resources :votes, only: %i[index create destroy]
    end
  end

  post 'users/new'
  post 'users/login'

end
