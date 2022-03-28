Rails.application.routes.draw do
  # get 'faculties/index'
  # get 'faculties/new'
  # get 'faculties/create'
  # get 'faculties/show'
  # get 'faculties/edit'
  # get 'faculties/update'
  # get 'faculties/destroy'
  # get 'students/index'
  # get 'students/new'
  # get 'students/create'
  # get 'students/show'
  # get 'students/edit'
  # get 'students/update'
  # get 'students/destroy'
  # get 'index/new'
  # get 'index/create'
  # get 'index/show'
  # get 'index/edit'
  # get 'index/update'
  # get 'index/destroy'
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
  resources :students
  resources :faculties


  # root "products#index"
end
