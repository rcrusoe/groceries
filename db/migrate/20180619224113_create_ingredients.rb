class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.decimal :qty
      t.string :measurement
      t.string :note
      t.string :aisle
      t.integer :recipe_id
      t.integer :grocery_item_id

      t.timestamps
    end
  end
end
