Rails.application.routes.draw do

  devise_for :users
  resources :pictures
  resources :articles
  resources :labels
  resources :users, :path => "managers"

  root to: "articles#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
