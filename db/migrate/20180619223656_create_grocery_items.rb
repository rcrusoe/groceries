class CreateGroceryItems < ActiveRecord::Migration[5.1]
  def change
    create_table :grocery_items do |t|
      t.string :name
      t.string :aisle

      t.timestamps
    end
  end
end
