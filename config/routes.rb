Rails.application.routes.draw do
  get 'product1/index'
  get 'product1/new'
  get 'product1/create'
  get 'product1/show'
  get 'product1/edit'
  get 'product1/update'
  get 'product1/destroy'
  get 'productts/index'
  get 'productts/new'
  get 'productts/create'
  get 'productts/show'
  get 'productts/edit'
  get 'productts/update'
  get 'productts/destroy'

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
  resources :employees
  # get '/employees' , to:
  get '/view_employees' , to: "employees#view_employees"
  # root "products#index"
  post '/increase', to: "employees#increase"
  post '/decrease', to: "employees#decrease"
end
