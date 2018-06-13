class RemoveEncodedImageFromRecipe < ActiveRecord::Migration[5.1]
  def change
    remove_column :recipes, :encoded_image, :string
  end
end
