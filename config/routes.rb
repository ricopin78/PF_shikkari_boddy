Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :relevant_parties, only:[:create,:update,:destroy]
  resources :event_todos, only:[:create,:update,:destroy]
  resources :todos, only:[:index,:show,:create,:edit,:update,:destroy]
  resources :titles, only:[:new,:create,:edit,:update,:destroy]
  resources :users, only:[:show]
  resources :events do
    resources :comments, only:[:create,:destroy]
    resources :okeys, only: [:create, :destroy]
    resources :attachments, only:[:create,:destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end