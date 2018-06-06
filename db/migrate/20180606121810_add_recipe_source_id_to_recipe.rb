class AddRecipeSourceIdToRecipe < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :recipe_source_id, :integer
  end
end
