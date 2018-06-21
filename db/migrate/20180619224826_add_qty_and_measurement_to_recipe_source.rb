class AddQtyAndMeasurementToRecipeSource < ActiveRecord::Migration[5.1]
  def change
    add_column :recipe_sources, :scrape_qty, :string
    add_column :recipe_sources, :scrape_measurement, :string
  end
end
