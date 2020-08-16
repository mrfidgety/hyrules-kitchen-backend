effects_dictionary = [
  {
    name: 'Chilly',
    detail: 'Resist Heat',
    outcome: :buff,
    time_per_ingredient: 120,
    potency_thresholds: [0, 6],
  },
  {
    name: 'Energizing',
    detail: 'Restore Stamina',
    outcome: :restorative,
    time_per_ingredient: nil,
    potency_thresholds: (0.2..3).step(0.2).map(&:to_d)
  },
  {
    name: 'Enduring',
    detail: 'Add Stamina',
    outcome: :additive,
    time_per_ingredient: nil,
    potency_thresholds: (0.2..2).step(0.2).map(&:to_d)
  },
  {
    name: 'Electro',
    detail: 'Resist Shock',
    outcome: :buff,
    time_per_ingredient: 120,
    potency_thresholds: [0, 4, 6]
  },
  {
    name: 'Fireproof',
    detail: 'Resist Fire',
    outcome: :buff,
    time_per_ingredient: 120,
    potency_thresholds: [0, 7]
  },
  {
    name: 'Hasty',
    detail: 'Increase Speed',
    outcome: :buff,
    time_per_ingredient: 30,
    potency_thresholds: [0,5, 7]
  },
  {
    name: 'Hearty',
    detail: 'Add Hearts',
    outcome: :additive,
    time_per_ingredient: nil,
    potency_thresholds: (1..25).to_a
  },
  {
    name: 'Mighty',
    detail: 'Increase Attack',
    outcome: :buff,
    time_per_ingredient: 20,
    potency_thresholds: [0, 5, 7]
  },
  {
    name: 'Sneaky',
    detail: 'Increase Stealth',
    outcome: :buff,
    time_per_ingredient: 90,
    potency_thresholds: [0, 6, 9]
  },
  {
    name: 'Spicy',
    detail: 'Resist Cold',
    outcome: :buff,
    time_per_ingredient: 120,
    potency_thresholds: [0, 6]
  },
  {
    name: 'Tough',
    detail: 'Increase Defense',
    outcome: :buff,
    time_per_ingredient: 20,
    potency_thresholds: [0, 5, 7]
  }
]

effects_dictionary.each do |effect_attributes|
  # See if effect already exists
  existing_effect = Effect.find_by(name: effect_attributes[:name])

  # Create new effect, or update existing effect
  if existing_effect.present?
    existing_effect.update(effect_attributes)
  else
    Effect.create(effect_attributes)
  end
end
