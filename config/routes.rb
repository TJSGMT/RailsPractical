Rails.application.routes.draw do
 
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
  resources :product1s
  resources :customers
  resources :orders
  
  
  get '/show_products' ,to: "product1s#show_product"
  # get '/employees' , to:
  get '/view_employees' , to: "employees#view_employees"
  # root "products#index"
  post '/increase', to: "employees#increase"
  post '/decrease', to: "employees#decrease"
  get '/show_order', to: "orders#show_order" 
end
