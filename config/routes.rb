Rails.application.routes.draw do
  get 'home/about'
  root 'books#top'
  devise_for :users
  resources :users, only: [:show, :edit, :update, :index]
  resources :books
  resources :home, only: [:about]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
