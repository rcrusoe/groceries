class AddScrapeDataToRecipeSources < ActiveRecord::Migration[5.1]
  def change
    add_column :recipe_sources, :recipe_index_link, :string
    add_column :recipe_sources, :category_css, :string
    add_column :recipe_sources, :recipe_css, :string
  end
end
