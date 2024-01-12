Rails.application.routes.draw do

  mount ActionCable.server => '/cable'
  resources :users
  get 'home', to: 'home#index'
  # get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  post 'message', to: 'messages#create'

  root 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
