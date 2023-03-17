class RecipesController < ApplicationController
  load_and_authorize_resource

  def index
    @recipes = Recipe.all.where(user_id: current_user.id)
  end

  def show
    @recipe_food = RecipeFood.select("MIN(id) AS id, SUM(quantity) AS quantity, recipe_id, food_id")
                             .includes(:recipe, :food)
                             .where(recipe_id: recipe_params[:recipe_id])
                             .group(:recipe_id, :food_id)
    @recipe = @recipe_food[0].recipe
  end

  def toggle_visibility
    @recipe = Recipe.find_by(id: toggle_visibility_params[:recipe_id])

    if @recipe.update_column(:public, toggle_visibility_params[:visibility] == 'true')
      render json: { status: 'successful' }
    else
      render json: { status: 'not successful' }
    end
  end

  def new
    @recipe = Recipe.new
  end

  def ingredients
    @recipe_id = recipe_params[:recipe_id]
    @foods = Food.all
  end

  def add_ingredients
    @recipe_food = RecipeFood.new(
      quantity: add_ingredients_params[:quantity],
      recipe_id: add_ingredients_params[:recipe_id],
      food_id: add_ingredients_params[:food_id]
    )

    if @recipe_food.save
      render json: { status: 'Food item successfully added' }, status: 201
    else
      render :ingredients, status: :unprocessable_entity
    end
  end

  def remove_ingredient
    recipe_food = RecipeFood.find_by(id: recipe_params[:recipe_food_id])

    if recipe_food.destroy
      redirect_to recipe_path(recipe_params[:recipe_id])
    else
      render recipe_path(recipe_params[:recipe_id]), status: :not_found
    end
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

    if recipe.destroy
      redirect_to recipes_path, status: :accepted
    else
      redirect_to recipes_path, status: :not_found
    end
  end

  private

  def recipe_params
    params.permit(:recipe_id, :recipe_food_id)
  end

  def toggle_visibility_params
    params.permit(:recipe_id, :visibility, :authenticity_token)
  end

  def create_recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end

  def add_ingredients_params
    params.permit(:recipe_id, :food_id, :quantity, :authenticity_token)
  end
end
