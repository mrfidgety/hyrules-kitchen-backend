class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients, id: :uuid do |t|
      t.text :name, null: false
      t.integer :value, default: 0
      t.decimal :base_hearts, precision: 4, scale: 2, default: 0
      t.references :effect, foreign_key: true, type: :uuid
      t.decimal :effect_potency, precision: 4, scale: 2
      t.integer :time_bonus, default: 0

      t.timestamps
    end
  end
end
