class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :link
      t.jsonb :ingredients

      t.timestamps
    end
  end
end
