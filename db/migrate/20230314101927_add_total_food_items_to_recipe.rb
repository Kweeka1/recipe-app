class AddTotalFoodItemsToRecipe < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :total_food_items, :integer, default: 0
  end
end
