class AddIndexToRecipeSources < ActiveRecord::Migration[5.1]
  def change
    add_index :recipe_sources, :slug, unique: true
  end
end
