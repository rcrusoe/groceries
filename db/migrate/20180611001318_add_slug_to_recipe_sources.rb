class AddSlugToRecipeSources < ActiveRecord::Migration[5.1]
  def change
    add_column :recipe_sources, :slug, :string
  end
end
