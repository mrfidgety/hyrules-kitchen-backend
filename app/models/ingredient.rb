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
class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  belongs_to :effect, optional: true

  enum category: {
    food: 'food',
    seasoning: 'seasoning',
    critter: 'critter',
    monster_part: 'monster_part',
    dragon_part: 'dragon_part',
    ore: 'ore',
    special: 'special'
  }

  SEASONINGS_REQUIRING_OTHER_INGREDIENTS = [
    'Cane Sugar',
    'Goat Butter',
    'Goron Spice',
    'Hylian Rice',
    'Rock Salt',
    'Tabantha Wheat'
  ].freeze

  public_constant :SEASONINGS_REQUIRING_OTHER_INGREDIENTS

  def parameterized_name
    name.gsub("'", '').parameterize.underscore
  end

  def single_ingredient_additional_heart
    return 0.5 if name == 'Fresh Milk'

    0
  end
end
