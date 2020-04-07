Rails.application.routes.draw do
  devise_for :users

  root 'homes#top'
  get 'homes/about'

  resources :users, only: [:index, :show ,:edit ,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'follows' => 'relationships#follower', as: 'follows'
    get 'followers' => 'relationships#followed', as: 'followers'
   collection do
     get 'leave'
     get 'follow'
   end
   member do
     get 'favorite'
   end
   end

   resources :recipes do
    resource :favorites, only:[:create,:destroy]
    resource :book_comments, only:[:create, :destroy]
    collection do
      get 'category_index'
    end
  end

    get 'search' => 'search#search', as: 'search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
