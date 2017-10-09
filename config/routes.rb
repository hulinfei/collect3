Rails.application.routes.draw do

  devise_for :users
  resources :pictures
  resources :articles
  resources :labels do
  	collection do
  		get 'descending'
  		get 'ascending'
  	end
  end
  resources :users, :path => "managers" do
  	member do
  		put 'active'
  		put 'unactive'
  	end
  	collection do
  		put 'active_all'
  		put 'unactive_all'
  	end
  end

  root to: "articles#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
