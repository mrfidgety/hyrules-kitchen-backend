# == Schema Information
#
# Table name: recipes
#
#  id              :uuid             not null, primary key
#  ingredients_key :text             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_recipes_on_ingredients_key  (ingredients_key) UNIQUE
#
class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :dish_recipes
  has_many :dishes, through: :dish_recipes

  def self.generate_key(ingredients)
    ingredients.map(&:id).sort.join('-')
  end
end
