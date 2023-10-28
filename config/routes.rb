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


  resources :books, except: [:new, :edit] do
  delete '/:id', to: 'books#destroy'
end


get 'home/index'

  get 'retours/show'
  get 'retours/create'
  get 'retours/delete'
  get 'retours/update'

  root "books#index"
  get "show" => 'livres#show'

  get 'membres/show'
   get 'membres/index'

  #get "index" => "books#index"
  #root 'welcome#index'
  #get 'profile', to: 'profile#show'

  #resources :books, only: [:index, :show, :edit, :update]

  get "up" => "rails/health#show", as: :rails_health_check

end

