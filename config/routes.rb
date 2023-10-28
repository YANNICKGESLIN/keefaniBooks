Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :books

  devise_for :membres
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

  get 'books/new'
  get 'books/create'
  get 'books/update'
  get 'books/show'
  get 'books/destroy'
  get 'books/edit'



get 'books/index'

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

