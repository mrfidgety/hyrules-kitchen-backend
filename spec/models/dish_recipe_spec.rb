# == Schema Information
#
# Table name: dish_recipes
#
#  id         :uuid             not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  dish_id    :uuid             not null
#  recipe_id  :uuid             not null
#
# Indexes
#
#  index_dish_recipes_on_dish_id    (dish_id)
#  index_dish_recipes_on_recipe_id  (recipe_id)
#
# Foreign Keys
#
#  fk_rails_...  (dish_id => dishes.id)
#  fk_rails_...  (recipe_id => recipes.id)
#
require 'rails_helper'

RSpec.describe DishRecipe, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
