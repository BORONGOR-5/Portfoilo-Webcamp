Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  devise_for :members, controllers: {
  sessions:      'members/sessions',
  passwords:     'members/passwords',
  registrations: 'members/registrations'
}

  namespace :admin do
  	root to: 'top#top'
  
  	resources :members, only:[:index, :edit, :update]
  
  	resources :genres, only: [:index, :create, :edit, :update]
  
  	resources :movies
  
  	resources :reviews, only: [:index, :edit, :destroy]
  	get '/member_reviews/:id', to: 'reviews#index_member', as: 'member_reviews'
  end
  
  scope module: :member do
  	get '/about', to: 'home#about'
  	get '/producer', to: 'home#producer'
  
  	resources :rooms, only: [:show, :create]
  
  	resources :messages, only: [:create]
  
  	resources :notifications, only: [:index]
  	get '/notifications', to: 'notifications#destroy_all'
  
  	resources :relationships, only: [:index, :show, :create, :destroy]
  
  	resources :favorites, only: [:create, :destroy]
  
  	resources :bookmarks, only: [:index, :create, :destroy]
  
  	resources :movies, only: [:index, :show]
  	root 'movies#top'
  	get 'genres/:id/sort', to: 'movies#sort', as: 'genres_sort'
  
  	resources :comments, only: [:new, :create, :destroy]
  
  	resources :reviews, only: [:show, :create, :edit, :update, :destroy]
  	get '/reviews', to: 'reviews#member_index'
  	get 'reviews/new/:id', to: 'reviews#new', as: 'new_review'
  	
  	resources :members, only: [:index, :show, :edit, :update]
  	get '/members/:id/destroy_page', to: 'members#destroy_page', as: 'destroy_page'
    post '/members/:id/leave', to: 'members#leave', as: 'leave'
  	get '/members/:id', to: 'member#update', as: 'members_update'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
