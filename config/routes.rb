Rails.application.routes.draw do
  devise_for :users
  get 'chats/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "chats#show"
  mount ActionCable.server => '/cable'
  resources :message
  resources :users
end
