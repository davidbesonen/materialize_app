Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'condition_groups#index'

  # This creates these routes [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :condition_groups
  resources :conditions

end