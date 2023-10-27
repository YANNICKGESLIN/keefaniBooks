Rails.application.routes.draw do
  get 'show/new'
  get 'show/create'
  get 'show/edit'
  get 'show/update'
  get 'library/index'
  get 'library/add_book'
  get 'library/list_books'
  get 'library/delete_book'
  get 'library/edit_book'
  get 'books/edit'
  get 'books/show'
  get 'books/create'
  get 'books/delete'
  get 'books/update'
  get 'books/index'
  get 'books/new'
  get 'retours/show'
  get 'retours/create'
  get 'retours/delete'
  get 'retours/update'
 # get 'home/index'
  root "home#index"
  get "show" => 'livres#show'
  #get "index" => 'books#index'
  get 'membres/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "index" => "books#index"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  #root "books#index"
end

