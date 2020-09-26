# == Schema Information
#
# Table name: dishes
#
#  id             :uuid             not null, primary key
#  duration       :integer          default(0)
#  effect_potency :decimal(4, 2)
#  hearts         :decimal(4, 2)    default(0.0)
#  value          :integer          default(0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  effect_id      :uuid
#
# Indexes
#
#  index_dishes_on_effect_id  (effect_id)
#
# Foreign Keys
#
#  fk_rails_...  (effect_id => effects.id)
#
class Dish < ApplicationRecord
  has_many :dish_recipes
  has_many :recipes, through: :dish_recipes
  belongs_to :effect, optional: true
end
