class EffectGenerator
  class << self
    def generate(*args)
      new(*args).generate
    end
  end

  def initialize(*ingredients)
    @ingredients = ingredients
  end

  def generate
    return {} unless valid_effect?

    {
      effect: effect,
      effect_potency: effect_potency,
      duration: effect_duration
    }
  end

  private

  attr_reader :ingredients

  def valid_effect?
    ingredients.map(&:effect_id).compact.uniq.length == 1
  end

  def effect
    @effect ||= ingredients.map(&:effect).compact.first
  end

  def effect_potency
    effect.calculate_potency_level(ingredients.map(&:effect_potency).compact.sum)
  end

  def effect_duration
    return unless effect.buff?

    effect_time + bonus_time + ingredient_count_time
  end

  def effect_time
    effect_ingredients.count * effect.time_per_ingredient
  end

  def bonus_time
    ingredients.uniq.map(&:time_bonus).compact.sum
  end

  def ingredient_count_time
    ingredients.count * 30
  end

  def effect_ingredients
    ingredients.select { |ingredient| ingredient.effect.present? }
  end
end
