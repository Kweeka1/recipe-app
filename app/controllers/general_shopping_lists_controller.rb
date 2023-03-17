class GeneralShoppingListsController < ApplicationController
  def index
    @recipe_foods = RecipeFood.select("MIN(id) AS id, SUM(quantity) AS quantity, recipe_id, food_id")
                                                 .where(recipe_id: params[:recipe_id])
                                                 .group(:recipe_id, :food_id)
  end
end
