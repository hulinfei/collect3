Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions' }

  resources :articles do
    resources :pictures#, shallow: true
  end

  resources :photos, only: [:index, :edit, :update, :destroy]

  resources :labels do
    member do
      put 'forbid'
      put 'permit'
    end
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
  		put 'activeall'
  		put 'unactiveall'
  	end
  end

  root to: "articles#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
