class AddEquivalenceKeyToDishes < ActiveRecord::Migration[6.0]
  def change
    add_column :dishes, :equivalence_key, :text

    add_index :dishes, :equivalence_key, unique: true
  end
end
