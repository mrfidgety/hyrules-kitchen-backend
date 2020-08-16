class AddCategoryToIngredients < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      CREATE TYPE ingredient_category AS ENUM (
        'food', 'seasoning', 'critter', 'monster_part', 'dragon_part', 'ore', 'special'
      );
    SQL

    add_column :ingredients, :category, :ingredient_category
  end

  def down
    remove_column :ingredients, :category

    execute <<-SQL
      DROP TYPE ingredient_category;
    SQL
  end
end
