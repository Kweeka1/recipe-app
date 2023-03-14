class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods

  private

  def increment_total_food_items(recipe)
    recipe.total_food_items.increment
    recipe.save
  end
end
