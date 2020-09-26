class CreateDishes < ActiveRecord::Migration[6.0]
  def change
    create_table :dishes, id: :uuid do |t|
      t.decimal :hearts, precision: 4, scale: 2, default: 0
      t.integer :value, default: 0
      t.references :effect, foreign_key: true, type: :uuid
      t.decimal :effect_potency, precision: 4, scale: 2
      t.integer :duration, default: 0

      t.timestamps
    end
  end
end
