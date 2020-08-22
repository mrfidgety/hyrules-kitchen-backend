# == Schema Information
#
# Table name: ingredients
#
#  id             :uuid             not null, primary key
#  base_hearts    :decimal(4, 2)    default(0.0)
#  category       :enum
#  effect_potency :decimal(4, 2)
#  name           :text             not null
#  time_bonus     :integer          default(0)
#  value          :integer          default(0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  effect_id      :uuid
#
# Indexes
#
#  index_ingredients_on_effect_id  (effect_id)
#
# Foreign Keys
#
#  fk_rails_...  (effect_id => effects.id)
#
class IngredientSerializer < Blueprinter::Base
  identifier :id

  fields :name, :value
end
