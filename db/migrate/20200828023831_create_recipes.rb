class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes, id: :uuid do |t|
      t.text :ingredients_key, null: false
      t.timestamps
    end

    add_index :recipes, :ingredients_key, unique: true
  end
end
