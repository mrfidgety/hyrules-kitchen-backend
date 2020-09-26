class CreateDishRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :dish_recipes, id: :uuid do |t|
      t.references :dish, null: false, foreign_key: true, type: :uuid
      t.references :recipe, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
