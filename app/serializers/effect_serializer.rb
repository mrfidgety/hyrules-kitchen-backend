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
class EffectSerializer < Blueprinter::Base
  identifier :id

  fields :detail, :name, :outcome, :potency_thresholds, :time_per_ingredient

  association :ingredients

  view :basic do
    exclude :ingredients
  end
end
