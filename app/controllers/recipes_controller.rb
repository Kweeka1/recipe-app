class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.where(user_id: current_user.id)
  end

  def show
    @recipe = Recipe.includes(recipe_foods: [:food]).find_by(id: recipe_params[:recipe_id])
  end

  def toggle_visibility
    @recipe = Recipe.find_by(id: toggle_visibility_params[:recipe_id])
    if toggle_visibility_params[:visibility] === 'true'
      @recipe.public = true
    else
      @recipe.public = false
    end
    @recipe.save
  end

  def new; end

  def destroy
    recipe = Recipe.find_by(id: recipe_params[:recipe_id])
    recipe.destroy
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.permit(:recipe_id)
  end

  def toggle_visibility_params
    params.permit(:recipe_id, :visibility)
  end
end
