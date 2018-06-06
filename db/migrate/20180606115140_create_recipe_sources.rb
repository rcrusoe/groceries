class CreateRecipeSources < ActiveRecord::Migration[5.1]
  def change
    create_table :recipe_sources do |t|
      t.string :name
      t.string :link
      t.string :scrape_name
      t.string :scrape_ingredient
      t.string :scrape_image
      t.string :slug

      t.timestamps
    end
  end
end
