Rails.application.routes.draw do

  root "homes#index"
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  
  resources :products
  resources :authors
  resources :books
  resources :students
  resources :faculties
  resources :employees
  resources :product1s
  resources :customers
  resources :orders  
  resources :comments
  
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  post '/sessions', to: 'sessions#create', as: 'sessions'
  delete '/sessions', to: 'sessions#destroy'
  
  get '/show_products' ,to: "product1s#show_product"
  get '/view_employees' , to: "employees#view_employees"
  post '/increase', to: "employees#increase"
  post '/decrease', to: "employees#decrease"
  get '/show_order', to: "orders#show_order"
  
  get '/sign_up', to: 'users#new'
  post '/sign_up', to: 'users#create'
  get '/edit', to: 'users#edit'
  post '/update', to: 'users#update'
  get '/sign_in', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  resources :events
  resources :users

  get '/enroll/:id', to: "events#join_event", as: 'enrollment' 
  post '/clear', to: "events#clear", as: 'clear'
  get '/like/:id/', to: "comments#like", as: 'like_comment'
  get '/unlike/:id/', to: "comments#unlike", as: 'unlike_comment'
  get '/delete/:id', to: "comments#delete", as: "delete_comment"
end
