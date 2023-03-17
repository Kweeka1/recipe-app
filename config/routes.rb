Rails.application.routes.draw do
  devise_for :users
  root 'public_recipes#index'

  # Public recipes
  get '/public_recipes', to: 'public_recipes#index', as: 'public_recipes'

  # Recipes
  get 'recipes', to: 'recipes#index', as: 'recipes'
  get 'recipes/new', to: 'recipes#new', as: 'new_recipe'
  post 'recipes/create', to: 'recipes#create', as: 'create_recipe'

  get 'recipes/:recipe_id', to: 'recipes#show', as: 'recipe'
  get 'recipes/:recipe_id/ingredients', to: 'recipes#ingredients', as: 'ingredients'
  post 'recipes/:recipe_id/visibility', to: 'recipes#toggle_visibility', as: 'toggle_recipe_visibility'
  post 'recipes/:recipe_id/ingredients', to: 'recipes#add_ingredients', as: 'add_ingredient'
  delete 'recipes/:recipe_id/ingredients/:recipe_food_id/destroy', to: 'recipes#remove_ingredient', as: 'remove_ingredient'
  delete 'recipes/:recipe_id/destroy', to: 'recipes#destroy', as: 'destroy_recipe'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Foods
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes do
    resources :shopping_lists, only: [:index]
  end

  get '/general_shopping_list', to: 'shopping_lists#general_shopping_list', as: 'general_list'
end
