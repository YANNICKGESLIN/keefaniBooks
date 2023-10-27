Rails.application.routes.draw do
  resources :posts
  devise_for :users
  get 'posts/create'
  get 'show/new'
  get 'show/create'
  get 'show/edit'
  get 'show/update'

  get 'emprunts/index'
  get 'emprunts/add_book'
  get 'emprunts/list_books'
  get 'emprunts/delete_book'
  get 'emprunts/edit_book'

  get 'books/index'
  get 'books/show'
  get 'books/new'
  get 'books/create'
  get 'books/edit'
  get 'books/update'
  get 'books/destroy'
  resources :books

get 'home/index'

  get 'retours/show'
  get 'retours/create'
  get 'retours/delete'
  get 'retours/update'

  root "home#index"
  get "show" => 'livres#show'

  get 'membres/show'
   get 'membres/index'

  #get "index" => "books#index"
  #root 'welcome#index'
  #get 'profile', to: 'profile#show'

  #resources :books, only: [:index, :show, :edit, :update]

  get "up" => "rails/health#show", as: :rails_health_check

end

