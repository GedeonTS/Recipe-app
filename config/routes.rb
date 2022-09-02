# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'foods#index'
  resources :foods, only: [:index, :new, :create, :edit, :update, :destroy]
   resources :recipes, only: %i[index new create destroy update show] do
    resources :recipe_foods, only: %i[index new create edit destroy update] 
  end
  resources :publics, only: %i[index show]
  resources :shoppings, only: %i[index]

end
