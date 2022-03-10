Rails.application.routes.draw do
  # get 'books/index'
  # get 'books/new'
  # get 'books/create'
  # get 'books/show'
  # get 'books/edit'
  # get 'books/update'
  # get 'books/destroy'
  # get 'authors/index'
  # get 'authors/new'
  # get 'authors/create'
  # get 'authors/show'
  # get 'authors/edit'
  # get 'authors/update'
  # get 'authors/destroy'
  # get 'products/index'
  # get 'products/new'
  # get 'products/create'
  # get 'products/show'
  # get 'products/edit'
  # get 'products/update'
  # get 'products/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "homes#index"
  get '/homes', to: "homes#index"
  
  resources :products
  resources :authors
  resources :books


  # root "products#index"
end
