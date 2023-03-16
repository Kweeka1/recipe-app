class GeneralShoppingListsController < ApplicationController
  def index
    @recipe_foods = RecipeFood.all.includes(:recipe, :food).where(recipe_id: params[:recipe_id])
  end
end
