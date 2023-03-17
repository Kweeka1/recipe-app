class ShoppingListsController < ApplicationController
  def index
    @recipe_foods = RecipeFood.select('MIN(id) AS id, SUM(quantity) AS quantity, recipe_id, food_id')
      .where(recipe_id: params[:recipe_id])
      .group(:recipe_id, :food_id)
  end

  def general_shopping_list
    @missing_foods = RecipeFood
      .select('foods.id AS id, foods.name AS name, SUM(recipe_foods.quantity) AS quantity, foods.price AS price')
      .joins(:food, :recipe)
      .where(recipes: { user_id: current_user.id })
      .where.not(foods: { user_id: current_user.id })
      .group('recipe_id, food_id, foods.id')
  end
end
