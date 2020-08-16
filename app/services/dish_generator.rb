class DishGenerator
  class << self
    def generate(*args)
      new(*args).generate
    end
  end

  # When calculating a dishes value, you add up the values
  # of each ingredient, then multiply by a number based on
  # how many ingredients are in the dish (1 - 5)
  VALUE_MULTIPLIER = [1.5, 1.8, 2.1, 2.4, 2.8].freeze

  def initialize(*ingredients)
    @ingredients = ingredients
  end

  def generate
    return rock_hard_dish if rock_hard?
    return dubious_dish if dubious?

    successful_dish
  end

  private

  attr_reader :ingredients

  # Any combination of ingredients that includes an 'ore'
  # ingredient type will automatically result in a rock-hard dish
  def rock_hard?
    ingredients.any?(&:ore?)
  end

  # There are specific combinations of ingredients that will
  # produce dubious food. Some may be missing, but will be added
  # in the future
  def dubious?
    critter_or_monster_present_without_other? ||
      elixir_with_mismatched_ingredient_effects? ||
      only_seasonings_that_require_other_ingredients?
  end

  # All rock-hard dishes have the same attributes, and
  # are not affected by individual ingredient attributes
  def rock_hard_dish
    { type: 'rock-hard-food', hearts: 0.25, value: 2 }
  end

  # Dubious dishes heal the sum of the ingredients base hearts,
  # with a minimum threshold of 1 heart, and sells for 2 rupees
  def dubious_dish
    { type: 'dubious-food', hearts: [1.0, base_hearts_sum].max, value: 2 }
  end

  # If there is a critter present, and no monster part
  # present, then the dish will be dubious. This is true for
  # the opposite, where a monster part is present without
  # a critter. Here ^ acts as XOR condition, where true is
  # returned only when each side of the condition is different
  def critter_or_monster_present_without_other?
    ingredients.any?(&:critter?) ^ ingredients.any?(&:monster_part?)
  end

  # Elixirs are created when a creddit and monster part are
  # ingredients. They cannot succeed unless all effects match.
  # This is unlike food dishes with multiple effects, which still
  # succeed but result in no effect
  def elixir_with_mismatched_ingredient_effects?
    ingredients.any?(&:critter?) && ingredients.map(&:effect).compact.uniq.length > 1
  end

  def only_seasonings_that_require_other_ingredients?
    ingredients.reject do |ingredient|
      Ingredient::SEASONINGS_REQUIRING_OTHER_INGREDIENTS.include?(ingredient.name)
    end.none?
  end

  def successful_dish
    {
      type: successful_dish_type,
      hearts: successful_dish_hearts,
      value: successful_dish_value,
      effect: successful_dish_effect
    }
  end

  # If the dish has a critter ingredient, then it is an elixir.
  # Otherwise, it is food
  def successful_dish_type
    ingredients.any?(&:critter?) ? 'elixir' : 'food'
  end

  # The sum of all ingredients base hearts multiplied by 2. If
  # the dish is made of only one specific ingredient then there
  # could be a 'bonus' heart value. I am only aware of 'Fresh Milk'
  # having this behaviour
  def successful_dish_hearts
    ((base_hearts_sum * 2) + single_ingredient_heart_bonus).round(2).to_f
  end

  # The sum of all ingredient values, multiplied by a value
  # determined from the number of ingredients. Then drop any
  # remainders, and round up to the nearest multiple of 10
  def successful_dish_value
    decimal_value = value_sum * VALUE_MULTIPLIER[ingredients.length - 1]
    integer_value = decimal_value.to_i

    (integer_value / 10.0).ceil * 10
  end

  def successful_dish_effect
    EffectGenerator.generate(*ingredients)
  end

  def base_hearts_sum
    ingredients.map(&:base_hearts).compact.sum
  end

  def value_sum
    ingredients.map(&:value).compact.sum
  end

  def single_ingredient_heart_bonus
    return 0 unless ingredients.uniq.one?

    ingredients.first.single_ingredient_additional_heart
  end
end
