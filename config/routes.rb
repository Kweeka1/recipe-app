Rails.application.routes.draw do
  devise_for :users
  root 'public_recipes#index'

  # Public recipes
  get '/public_recipes', to: 'public_recipes#index', as: 'public_recipes'

  # Recipes
  get 'recipes', to: 'recipes#index', as: 'recipes'
  get 'recipes/:recipe_id', to: 'recipes#show', as: 'recipe'
  get 'recipes/new', to: 'recipes#new', as: 'new_recipe'
  delete 'recipes/:recipe_id/destroy', to: 'recipes#destroy', as: 'destroy_recipe'
  post 'recipes/:recipe_id/toggle_visibility', to: 'recipes#toggle_visibility', as: 'toggle_recipe_visibility'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Foods
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes do
    resources :general_shopping_lists, only: [:index]
  end
end
