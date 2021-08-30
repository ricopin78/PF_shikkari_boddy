Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :users, only: [:show] do
    resources :titles, only: [:new, :create, :edit, :update, :destroy]
    resources :todos, only: [:index, :show, :create, :edit, :update, :destroy] do
      collection do
        get 'search'
      end
    end
  end
  resources :events do
    resources :comments, only: [:create, :destroy]
    resources :okeys, only: [:create, :destroy]
    resources :relevant_parties, only: [:create, :update, :destroy]
    resources :event_todos, only: [:create, :update, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
