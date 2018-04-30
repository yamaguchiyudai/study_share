Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'post_images#index'
  get 'category_index_English' => 'post_images#category_index_English'
  get 'category_index_mathematics' => 'post_images#category_index_mathematics'
  get 'category_index_Japanese' => 'post_images#category_index_Japanese'
  get 'category_index_science' => 'post_images#category_index_science'
  get 'category_index_social_study' => 'post_images#category_index_social_study'

  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
  	resource :favorites, only: [:create, :destroy]
  	resource :post_comments, only: [:create, :destroy]
	  	collection do
	    post '/pay' =>'post_images#pay'
	  	end
  end
  resources :users, only: [:show, :edit, :update]

end
