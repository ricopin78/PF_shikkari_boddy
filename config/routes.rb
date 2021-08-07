Rails.application.routes.draw do
  devise_for :users
  resources :comments, only:[:create,:update,:destroy]
  resources :okeys, only:[:create,:destroy]
  resources :relevant_parties, only:[:create,:update,:destroy]
  resources :attachments, only:[:create,:destroy]
  resources :event_todos, only:[:create,:update,:destroy]
  resources :todos, only:[:index,:show,:create,:edit,:update,:destroy]
  resources :events
  resources :comments, only:[:index,:create,:edit,:update,:show,:destroy]
  resources :titles, only:[:new,:create,:update,:destroy]
  resources :users, only:[:show]
  root to: 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
