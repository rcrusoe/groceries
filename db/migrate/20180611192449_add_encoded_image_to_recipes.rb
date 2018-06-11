class AddEncodedImageToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :encoded_image, :string
  end
end
