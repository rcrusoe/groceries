class CreateMealPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :meal_plans do |t|
      t.integer :recipe_id
      t.string :user_id
      t.string :status

      t.timestamps
    end
  end
end
