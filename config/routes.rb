Rails.application.routes.draw do
  devise_for :users
  #get 'chats/show'
  resources :chats
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "chats#show"
  mount ActionCable.server => '/cable'
  resources :message
  resources :users do
    resources :rooms
  end
  
/   namespace :api, defaults: {format: :json} do
     namespace :v1 do
       resources :users
     end
   end  /
  get 'json_users', to: 'json#list_all_json'

end
