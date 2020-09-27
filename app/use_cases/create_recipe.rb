class CreateRecipe
  include UseCase

  attr_reader :recipe

  def initialize(ingredients:)
    @ingredients = ingredients
  end

  def perform
    return if existing_recipe.present?

    create_recipe
    generate_dish
  end

  private

  attr_reader :ingredients

  def existing_recipe
    @recipe = Recipe.find_by(ingredients_key: ingredients_key)
  end

  def create_recipe
    @recipe = Recipe.create(ingredients: ingredients, ingredients_key: ingredients_key)
  end

  def ingredients_key
    @ingredients_key ||= Recipe.generate_key(ingredients)
  end

  def generate_dish
    dish_attributes = DishGenerator.generate(*ingredients)
    equivalence_key = Dish.generate_key(dish_attributes)

    existing_dish = Dish.find_by(equivalence_key: equivalence_key)

    if existing_dish.present?
      existing_dish.recipes << recipe
    else
      Dish.create(dish_attributes.merge(equivalence_key: equivalence_key, recipes: [recipe]))
    end
  end
end
