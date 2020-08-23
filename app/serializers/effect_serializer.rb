class EffectSerializer < Blueprinter::Base
  identifier :id

  fields :detail, :name, :outcome, :potency_thresholds, :time_per_ingredient

  association :ingredients

  view :basic do
    exclude :ingredients
  end
end
