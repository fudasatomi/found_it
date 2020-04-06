Rails.application.routes.draw do
  get 'recipes/new'
  get 'recipes/index'
  get 'recipes/category_index'
  get 'recipes/show'
  get 'recipes/edit'
  get 'relationships/follow'
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  get 'users/leave'
  get 'homes/top'
  get 'homes/about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
