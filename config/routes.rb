Rails.application.routes.draw do
  get 'procedures/new'
  get 'procedures/edit'
  get 'materials/new'
  get 'materials/edit'
  get 'details/new'
  devise_for :users

  root 'homes#top'
  get 'homes/about'

  resources :users, only: [:show ,:edit ,:update ,:destroy] do
    resource :relationships, only: [:create, :destroy]
    get 'follows' => 'relationships#follower', as: 'follows'
    get 'followers' => 'relationships#followed', as: 'followers'
   collection do
     get 'leave'
   end
   member do
     get 'recipes' => 'users#recipes', as:'recipe_indedx'
     get 'favorite' => 'favorites#favorite', as:'favorite'
   end
   end

   resources :recipes do
    member do
      get 'category_all_index'
      get 'category_index'
    end

    collection do
      get 'search' => 'recipes#search', as: 'search'
    end

    resources :materials, only:[:create,:new,:edit ,:update,:destroy]
    resources :procedures, only:[:create,:new,:edit ,:update,:destroy]
    resources :comments, only:[:create, :destroy]
    resource :favorites, only:[:create,:destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
