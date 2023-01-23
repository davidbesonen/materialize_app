Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'condition_groups#index'
  get '/new', to: 'condition_groups#new'

  resources :condition_groups
end
