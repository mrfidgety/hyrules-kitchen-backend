class AddOutcomeToEffects < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      CREATE TYPE effect_outcome AS ENUM ('buff', 'additive', 'restorative');
    SQL

    add_column :effects, :outcome, :effect_outcome
  end

  def down
    remove_column :effects, :outcome

    execute <<-SQL
      DROP TYPE effect_outcome;
    SQL
  end
end
