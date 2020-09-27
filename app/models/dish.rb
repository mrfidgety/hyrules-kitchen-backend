# == Schema Information
#
# Table name: dishes
#
#  id              :uuid             not null, primary key
#  category        :enum
#  duration        :integer          default(0)
#  effect_potency  :decimal(4, 2)
#  equivalence_key :text
#  hearts          :decimal(4, 2)    default(0.0)
#  value           :integer          default(0)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  effect_id       :uuid
#
# Indexes
#
#  index_dishes_on_effect_id        (effect_id)
#  index_dishes_on_equivalence_key  (equivalence_key) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (effect_id => effects.id)
#
class Dish < ApplicationRecord
  has_many :dish_recipes
  has_many :recipes, through: :dish_recipes
  belongs_to :effect, optional: true

  enum category: {
    rock_hard_food: 'rock_hard_food',
    dubious_food: 'dubious_food',
    elixir: 'elixir',
    food: 'food'
  }

  def self.generate_key(attributes)
    [
      attributes[:hearts],
      attributes[:value],
      attributes[:effect_id] || attributes[:effect]&.id,
      attributes[:effect_potency],
      attributes[:duration]
    ].join('-')
  end
end
