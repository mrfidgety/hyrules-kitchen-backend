ingredients_dictionary = [
  { name: 'Apple', category: :food, value: 3, base_hearts: 0.5 },
  { name: 'Armoranth', category: :food, value: 5, effect: 'Tough', effect_potency: 1 },
  { name: 'Armored Carp', category: :food, value: 10, base_hearts: 1, effect: 'Tough', effect_potency: 2 },
  { name: 'Armored Porgy', category: :food, value: 10, base_hearts: 1, effect: 'Tough', effect_potency: 3 },
  { name: 'Big Hearty Radish', category: :food, value: 15, base_hearts: 4, effect: 'Hearty', effect_potency: 5 },
  { name: 'Big Hearty Truffle', category: :food, value: 15, base_hearts: 3, effect: 'Hearty', effect_potency: 4 },
  { name: 'Blue Nightshade', category: :food, value: 4, effect: 'Sneaky', effect_potency: 1 },
  { name: 'Bright-eyed Crab', category: :food, value: 10, base_hearts: 1, effect: 'Energizing', effect_potency: 0.57 },
  { name: 'Chillfin Trout', category: :food, value: 6,  base_hearts: 1, effect: 'Chilly', effect_potency: 3 },
  { name: 'Chillshroom', category: :food, value: 4,  base_hearts: 0.5, effect: 'Chilly', effect_potency: 2 },
  { name: 'Cool Safflina', category: :food, value: 3, effect: 'Chilly', effect_potency: 1 },
  { name: 'Courser Bee Honey', category: :food, value: 10, base_hearts: 2, effect: 'Energizing', effect_potency: 0.57 },
  { name: 'Electric Safflina', category: :food, value: 3, effect: 'Electro', effect_potency: 1 },
  { name: 'Endura Carrot', category: :food, value: 30, base_hearts: 2, effect: 'Enduring', effect_potency: 0.43 },
  { name: 'Endura Shroom', category: :food, value: 6, base_hearts: 1, effect: 'Enduring', effect_potency: 0.16 },
  { name: 'Fleet-Lotus Seeds', category: :food, value: 5, base_hearts: 0.5, effect: 'Hasty', effect_potency: 2 },
  { name: 'Fortified Pumpkin', category: :food, value: 5, base_hearts: 0.5, effect: 'Tough', effect_potency: 2 },
  { name: 'Hearty Bass', category: :food, value: 18, base_hearts: 2, effect: 'Hearty', effect_potency: 2 },
  { name: 'Hearty Blueshell Snail', category: :food, value: 15, base_hearts: 3, effect: 'Hearty', effect_potency: 3 },
  { name: 'Hearty Durian', category: :food, value: 15, base_hearts: 3, effect: 'Hearty', effect_potency: 4 },
  { name: 'Hearty Radish', category: :food, value: 8, base_hearts: 2.5, effect: 'Hearty', effect_potency: 3 },
  { name: 'Hearty Salmon', category: :food, value: 10, base_hearts: 4, effect: 'Hearty', effect_potency: 4 },
  { name: 'Hearty Truffle', category: :food, value: 6, base_hearts: 2, effect: 'Hearty', effect_potency: 1 },
  { name: 'Hydromelon', category: :food, value: 5, base_hearts: 0.5, effect: 'Chilly', effect_potency: 1 },
  { name: 'Hylian Shroom', category: :food, value: 3, base_hearts: 0.5 },
  { name: 'Hyrule Bass', category: :food, value: 6, base_hearts: 1 },
  { name: 'Hyrule Herb', category: :food, value: 3, base_hearts: 1 },
  { name: 'Ironshell Crab', category: :food, value: 8, base_hearts: 1, effect: 'Tough', effect_potency: 2 },
  { name: 'Ironshroom', category: :food, value: 5, base_hearts: 0.5, effect: 'Tough', effect_potency: 2 },
  { name: 'Mighty Bananas', category: :food, value: 5, base_hearts: 0.5, effect: 'Mighty', effect_potency: 2 },
  { name: 'Mighty Carp', category: :food, value: 10, base_hearts: 1, effect: 'Mighty', effect_potency: 2 },
  { name: 'Mighty Porgy', category: :food, value: 10, base_hearts: 1, effect: 'Mighty', effect_potency: 3 },
  { name: 'Mighty Thistle', category: :food, value: 5, effect: 'Mighty', effect_potency: 1 },
  { name: 'Palm Fruit', category: :food, value: 4, base_hearts: 1 },
  { name: 'Raw Bird Drumstick', category: :food, value: 8, base_hearts: 1 },
  { name: 'Raw Bird Thigh', category: :food, value: 15, base_hearts: 1.5 },
  { name: 'Raw Gourmet Meat', category: :food, value: 35, base_hearts: 3 },
  { name: 'Raw Meat', category: :food, value: 8, base_hearts: 1 },
  { name: 'Raw Prime Meat', category: :food, value: 15, base_hearts: 1.5},
  { name: 'Raw Whole Bird', category: :food, value: 35, base_hearts: 3 },
  { name: 'Razorclaw Crab', category: :food, value: 8, base_hearts: 1, effect: 'Mighty', effect_potency: 2 },
  { name: 'Razorshroom', category: :food, value: 5, base_hearts: 0.5, effect: 'Mighty', effect_potency: 2 },
  { name: 'Rushroom', category: :food, value: 3, base_hearts: 0.5, effect: 'Hasty', effect_potency: 1 },
  { name: 'Sanke Carp', category: :food, value: 20, base_hearts: 1 },
  { name: 'Silent Princess', category: :food, value: 10, base_hearts: 1, effect: 'Sneaky', effect_potency: 3 },
  { name: 'Silent Shroom', category: :food, value: 3, base_hearts: 0.5, effect: 'Sneaky', effect_potency: 2 },
  { name: 'Sizzlefin Trout', category: :food, value: 6, base_hearts: 1, effect: 'Spicy', effect_potency: 2 },
  { name: 'Sneaky River Snail', category: :food, value: 6, base_hearts: 1, effect: 'Sneaky', effect_potency: 1 },
  { name: 'Spicy Pepper', category: :food, value: 3, base_hearts: 0.5, effect: 'Spicy', effect_potency: 1 },
  { name: 'Stamella Shroom', category: :food, value: 5, base_hearts: 0.5, effect: 'Energizing', effect_potency: 0.28 },
  { name: 'Staminoka Bass', category: :food, value: 18, base_hearts: 1, effect: 'Energizing', effect_potency: 1.14 },
  { name: 'Stealthfin Trout', category: :food, value: 10, base_hearts: 1, effect: 'Sneaky', effect_potency: 2 },
  { name: 'Sunshroom', category: :food, value: 4, base_hearts: 0.5, effect: 'Spicy', effect_potency: 2 },
  { name: 'Swift Carrot', category: :food, value: 4, base_hearts: 0.5, effect: 'Hasty', effect_potency: 1 },
  { name: 'Swift Violet', category: :food, value: 10, effect: 'Hasty', effect_potency: 2 },
  { name: 'Voltfin Trout', category: :food, value: 6, base_hearts: 1, effect: 'Electro', effect_potency: 3 },
  { name: 'Voltfruit', category: :food, value: 4, base_hearts: 0.5, effect: 'Electro', effect_potency: 1 },
  { name: 'Warm Safflina', category: :food, value: 3, effect: 'Spicy', effect_potency: 1 },
  { name: 'Wildberry', category: :food, value: 3, base_hearts: 0.5 },
  { name: 'Zapshroom', category: :food, value: 4, base_hearts: 0.5, effect: 'Electro', effect_potency: 2 },
  { name: 'Acorn', category: :seasoning, value: 2, base_hearts: 0.25, time_bonus: 20 },
  { name: 'Bird Egg', category: :seasoning, value: 3, base_hearts: 1, time_bonus: 60 },
  { name: 'Cane Sugar', category: :seasoning, value: 3, time_bonus: 50 },
  { name: 'Chickaloo Tree Nut', category: :seasoning, value: 3, base_hearts: 0.25, time_bonus: 10 },
  { name: 'Fresh Milk', category: :seasoning, value: 3, base_hearts: 0.5, time_bonus: 50 },
  { name: 'Goat Butter', category: :seasoning, value: 3, time_bonus: 50 },
  { name: 'Goron Spice', category: :seasoning, value: 4, time_bonus: 60 },
  { name: 'Hylian Rice', category: :seasoning, value: 3, base_hearts: 1, time_bonus: 30 },
  { name: 'Rock Salt', category: :seasoning, value: 2, time_bonus: 30 },
  { name: 'Tabantha Wheat', category: :seasoning, value: 3, base_hearts: 1, time_bonus: 30 },
  { name: 'Dinraal\'s Claw', category: :dragon_part, value: 1, base_hearts: 1, time_bonus: 180 },
  { name: 'Dinraal\'s Scale', category: :dragon_part, value: 1, base_hearts: 0.625, time_bonus: 60 },
  { name: 'Farosh\'s Claw', category: :dragon_part, value: 1, base_hearts: 1, time_bonus: 180 },
  { name: 'Farosh\'s Scale', category: :dragon_part, value: 1, base_hearts: 0.625, time_bonus: 60 },
  { name: 'Naydra\'s Claw', category: :dragon_part, value: 1, base_hearts: 1, time_bonus: 180 },
  { name: 'Naydra\'s Scale', category: :dragon_part, value: 1, base_hearts: 0.625, time_bonus: 60 },
  { name: 'Shard of Dinraal\'s Fang', category: :dragon_part, value: 1, base_hearts: 1.25, time_bonus: 600 },
  { name: 'Shard of Dinraal\'s Horn', category: :dragon_part, value: 1, base_hearts: 1.875, time_bonus: 1800 },
  { name: 'Shard of Farosh\'s Fang', category: :dragon_part, value: 1, base_hearts: 1.25, time_bonus: 600 },
  { name: 'Shard of Farosh\'s Horn', category: :dragon_part, value: 1, base_hearts: 1.875, time_bonus: 1800 },
  { name: 'Shard of Naydra\'s Fang', category: :dragon_part, value: 1, base_hearts: 1.25, time_bonus: 600 },
  { name: 'Shard of Naydra\'s Horn', category: :dragon_part, value: 1, base_hearts: 1.875, time_bonus: 1800 },
  { name: 'Bladed Rhino Beetle', category: :critter, value: 4, effect: 'Mighty', effect_potency: 1 },
  { name: 'Cold Darner', category: :critter, value: 2, effect: 'Chilly', effect_potency: 2 },
  { name: 'Electric Darner', category: :critter, value: 2, effect: 'Electro', effect_potency: 2 },
  { name: 'Energetic Rhino Beetle', category: :critter, value: 2, effect: 'Energizing', effect_potency: 1.72 },
  { name: 'Fireproof Lizard', category: :critter, value: 5, effect: 'Fireproof', effect_potency: 1 },
  { name: 'Hearty Lizard', category: :critter, value: 20, effect: 'Hearty', effect_potency: 4 },
  { name: 'Hightail Lizard', category: :critter, value: 2, effect: 'Hasty', effect_potency: 1 },
  { name: 'Hot-footed Frog', category: :critter, value: 2, effect: 'Hasty', effect_potency: 2 },
  { name: 'Restless Cricket', category: :critter, value: 2, effect: 'Energizing', effect_potency: 0.28 },
  { name: 'Rugged Rhino Beetle', category: :critter, value: 4, effect: 'Tough', effect_potency: 1 },
  { name: 'Smotherwing Butterfly', category: :critter, value: 2, effect: 'Fireproof', effect_potency: 2 },
  { name: 'Summerwing Butterfly', category: :critter, value: 2, effect: 'Spicy', effect_potency: 1 },
  { name: 'Sunset Firefly', category: :critter, value: 2, effect: 'Sneaky', effect_potency: 1 },
  { name: 'Thunderwing Butterfly', category: :critter, value: 2, effect: 'Electro', effect_potency: 1 },
  { name: 'Tireless Frog', category: :critter, value: 20, base_hearts: 2, effect: 'Enduring', effect_potency: 0.27 },
  { name: 'Warm Darner', category: :critter, value: 2, effect: 'Spicy', effect_potency: 2 },
  { name: 'Winterwing Butterfly', category: :critter, value: 2, effect: 'Chilly', effect_potency: 1 },
  { name: 'Ancient Core', category: :monster_part, value: 80, time_bonus: 160 },
  { name: 'Ancient Gear', category: :monster_part, value: 30, time_bonus: 80 },
  { name: 'Ancient Screw', category: :monster_part, value: 12, time_bonus: 40 },
  { name: 'Ancient Shaft', category: :monster_part, value: 40, time_bonus: 80 },
  { name: 'Ancient Spring', category: :monster_part, value: 15, time_bonus: 40 },
  { name: 'Bokoblin Fang', category: :monster_part, value: 8, time_bonus: 80 },
  { name: 'Bokoblin Guts', category: :monster_part, value: 20, time_bonus: 160 },
  { name: 'Bokoblin Horn', category: :monster_part, value: 3, time_bonus: 40 },
  { name: 'Chuchu Jelly', category: :monster_part, value: 5, time_bonus: 40 },
  { name: 'Electric Keese Wing', category: :monster_part, value: 6, time_bonus: 80 },
  { name: 'Fire Keese Wing', category: :monster_part, value: 6, time_bonus: 80 },
  { name: 'Giant Ancient Core', category: :monster_part, value: 200, time_bonus: 160 },
  { name: 'Hinox Guts', category: :monster_part, value: 80, time_bonus: 160 },
  { name: 'Hinox Toenail', category: :monster_part, value: 20, time_bonus: 40 },
  { name: 'Hinox Tooth', category: :monster_part, value: 35, time_bonus: 80 },
  { name: 'Ice Keese Wing', category: :monster_part, value: 6, time_bonus: 80 },
  { name: 'Icy Lizalfos Tail', category: :monster_part, value: 35, time_bonus: 160 },
  { name: 'Keese Eyeball', category: :monster_part, value: 20, time_bonus: 160 },
  { name: 'Keese Wing', category: :monster_part, value: 2, time_bonus: 40 },
  { name: 'Lizalfos Horn', category: :monster_part, value: 10, time_bonus: 40 },
  { name: 'Lizalfos Tail', category: :monster_part, value: 28, time_bonus: 160 },
  { name: 'Lizalfos Talon', category: :monster_part, value: 15, time_bonus: 80 },
  { name: 'Lynel Guts', category: :monster_part, value: 200, time_bonus: 160 },
  { name: 'Lynel Hoof', category: :monster_part, value: 50, time_bonus: 80 },
  { name: 'Lynel Horn', category: :monster_part, value: 40, time_bonus: 40 },
  { name: 'Moblin Fang', category: :monster_part, value: 12, time_bonus: 80 },
  { name: 'Moblin Guts', category: :monster_part, value: 25, time_bonus: 160 },
  { name: 'Moblin Horn', category: :monster_part, value: 5, time_bonus: 40 },
  { name: 'Molduga Fin', category: :monster_part, value: 30, time_bonus: 80 },
  { name: 'Molduga Guts', category: :monster_part, value: 110, time_bonus: 160 },
  { name: 'Octo Balloon', category: :monster_part, value: 5, time_bonus: 40 },
  { name: 'Octorok Eyeball', category: :monster_part, value: 25, time_bonus: 80 },
  { name: 'Octorok Tentacle', category: :monster_part, value: 10, time_bonus: 40 },
  { name: 'Red Chuchu Jelly', category: :monster_part, value: 10, time_bonus: 80 },
  { name: 'Red Lizalfos Tail', category: :monster_part, value: 35, time_bonus: 160 },
  { name: 'White Chuchu Jelly', category: :monster_part, value: 10, time_bonus: 80 },
  { name: 'Yellow Chuchu Jelly', category: :monster_part, value: 10, time_bonus: 80 },
  { name: 'Yellow Lizalfos Tail', category: :monster_part, value: 35, time_bonus: 160 },
  { name: 'Amber', category: :ore, value: 30 },
  { name: 'Diamond', category: :ore, value: 500 },
  { name: 'Flint', category: :ore, value: 5 },
  { name: 'Luminous Stone', category: :ore, value: 70 },
  { name: 'Opal', category: :ore, value: 60 },
  { name: 'Ruby', category: :ore, value: 210 },
  { name: 'Sapphire', category: :ore, value: 260 },
  { name: 'Topaz', category: :ore, value: 180 },
  { name: 'Wood', category: :ore, value: 2 },
  { name: 'Fairy', category: :special, base_hearts: 5 },
  { name: 'Monster Extract', category: :special },
  { name: 'Star Fragment', category: :special },
]

ingredients_dictionary.each do |ingredient_attributes|
  # See if ingredient already exists
  ingredient = Ingredient.find_by(name: ingredient_attributes[:name])

  # Add the effect to the ingredient attributes
  if ingredient_attributes[:effect].present?
    effect = Effect.find_by(name: ingredient_attributes.delete(:effect))
    ingredient_attributes.merge!(effect: effect)
  end

  # Create new ingredient, or update existing ingredient
  if ingredient.present?
    ingredient.update(ingredient_attributes)
  else
    ingredient = Ingredient.create(ingredient_attributes)
  end

  # Update the attached image
  ingredient.image.attach(
    io: File.open(Rails.root.join("app/assets/images/ingredients/#{ingredient.parameterized_name}.png")),
    filename: "#{ingredient.parameterized_name}.png"
  )
end
