class AddCategoryToDishes < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      CREATE TYPE dish_category AS ENUM (
        'rock_hard_food', 'dubious_food', 'elixir', 'food'
      );
    SQL

    add_column :dishes, :category, :dish_category
  end

  def down
    remove_column :dishes, :category

    execute <<-SQL
      DROP TYPE dish_category;
    SQL
  end
end
