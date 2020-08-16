class CreateEffects < ActiveRecord::Migration[6.0]
  def change
    create_table :effects, id: :uuid do |t|
      t.text :name, null: false
      t.text :detail, null: false
      t.integer :time_per_ingredient
      t.decimal :potency_thresholds, precision: 4, scale: 2, array: true, null: false

      t.timestamps
    end
  end
end
