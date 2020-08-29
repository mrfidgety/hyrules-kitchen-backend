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

class RecipeSerializer < Blueprinter::Base
  identifier :id

  association :ingredients
end
