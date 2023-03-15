class AddTotalPriceToRecipe < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :total_price, :integer, default: 0
  end
end
