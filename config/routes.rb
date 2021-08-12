Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :comments, only:[:create,:update,:destroy]
  resources :relevant_parties, only:[:create,:update,:destroy]
  resources :attachments, only:[:create,:destroy]
  resources :event_todos, only:[:create,:update,:destroy]
  resources :todos, only:[:index,:show,:create,:edit,:update,:destroy]
  resources :comments, only:[:index,:create,:edit,:update,:show,:destroy]
  resources :titles, only:[:new,:create,:edit,:update,:destroy]
  resources :users, only:[:show]
  resources :events do
    resources :okeys, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end