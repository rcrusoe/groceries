class AddPaginationToRecipeSource < ActiveRecord::Migration[5.1]
  def change
    add_column :recipe_sources, :multiple_pages, :boolean
  end
end
