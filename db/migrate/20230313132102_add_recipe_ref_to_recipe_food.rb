class AddRecipeRefToRecipeFood < ActiveRecord::Migration[7.0]
  def change
    add_reference :recipe_foods, :recipe, index: true, foreign_key: true
  end
end
