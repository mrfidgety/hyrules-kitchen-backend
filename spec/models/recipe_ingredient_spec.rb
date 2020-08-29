# == Schema Information
#
# Table name: recipe_ingredients
#
#  id            :uuid             not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  ingredient_id :uuid             not null
#  recipe_id     :uuid             not null
#
# Indexes
#
#  index_recipe_ingredients_on_ingredient_id  (ingredient_id)
#  index_recipe_ingredients_on_recipe_id      (recipe_id)
#
# Foreign Keys
#
#  fk_rails_...  (ingredient_id => ingredients.id)
#  fk_rails_...  (recipe_id => recipes.id)
#
require 'rails_helper'

RSpec.describe RecipeIngredient, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
