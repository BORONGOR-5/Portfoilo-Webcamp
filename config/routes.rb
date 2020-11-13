Rails.application.routes.draw do
  namespace :admins do
    get 'members/show'
    get 'members/edit'
    get 'members/index'
    get 'members/update'
  end
  namespace :admins do
    get 'genres/index'
    get 'genres/create'
    get 'genres/edit'
    get 'genres/update'
  end
  namespace :admins do
    get 'movies/top'
    get 'movies/index'
    get 'movies/new'
    get 'movies/create'
    get 'movies/show'
    get 'movies/edit'
    get 'movies/update'
  end
  namespace :admins do
    get 'reviews/index'
    get 'reviews/edit'
    get 'reviews/update'
  end
  namespace :admins do
    get 'top/top'
  end
  namespace :members do
    get 'home/about'
    get 'home/producer'
  end
  namespace :members do
    get 'rooms/show'
    get 'rooms/create'
  end
  namespace :members do
    get 'messages/create'
  end
  namespace :members do
    get 'notifications/index'
    get 'notifications/destroy_all'
  end
  namespace :members do
    get 'relationships/index'
    get 'relationships/show'
    get 'relationships/create'
    get 'relationships/destroy'
  end
  namespace :members do
    get 'favorites/create'
    get 'favorites/destroy'
  end
  namespace :members do
    get 'bookmarks/index'
    get 'bookmarks/create'
    get 'bookmarks/destroy'
  end
  namespace :members do
    get 'movies/top'
    get 'movies/index'
    get 'movies/show'
  end
  namespace :members do
    get 'comments/new'
    get 'comments/create'
  end
  namespace :members do
    get 'reviews/member_index'
    get 'reviews/show'
    get 'reviews/new'
    get 'reviews/create'
    get 'reviews/edit'
    get 'reviews/update'
    get 'reviews/destroy'
  end
  devise_for :admins
  devise_for :members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
