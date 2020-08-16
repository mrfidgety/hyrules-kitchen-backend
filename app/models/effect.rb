# == Schema Information
#
# Table name: effects
#
#  id                  :uuid             not null, primary key
#  detail              :text             not null
#  name                :text             not null
#  outcome             :enum
#  potency_thresholds  :decimal(4, 2)    not null, is an Array
#  time_per_ingredient :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Effect < ApplicationRecord
  has_many :ingredients

  enum outcome: {
                  buff: 'buff',
                  additive: 'additive',
                  restorative: 'restorative'
                }

  def calculate_potency_level(potency_value)
    potency_level = potency_thresholds.reject { |t| potency_value < t }.length

    "#{potency_level}/#{potency_thresholds.length}"
  end
end
