class RenameRecipeIngredients < ActiveRecord::Migration[5.1]
  def change
    rename_column :recipes, :ingredients, :ingredients_array
  end
end
