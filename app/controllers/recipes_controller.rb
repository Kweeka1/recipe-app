class RecipesController < ApplicationController
  load_and_authorize_resource

  def index
    @recipes = Recipe.all.where(user_id: current_user.id)
  end

  def show
    @recipe = Recipe.includes(recipe_foods: [:food]).find_by(id: recipe_params[:recipe_id])
  end

  def toggle_visibility
    @recipe = Recipe.find_by(id: toggle_visibility_params[:recipe_id])
    @recipe.update_column(:public, toggle_visibility_params[:visibility] == 'true')
    render json: { status: 'successful' }
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(create_recipe_params.merge(user_id: current_user.id))

    if @recipe.save
      redirect_to recipe_path @recipe
    else
      render :new, status: :unprocessable_entity
    end
  end

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
    params.permit(:recipe_id, :visibility, :authenticity_token)
  end

  def create_recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
