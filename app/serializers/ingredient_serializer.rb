class IngredientSerializer < Blueprinter::Base
  identifier :id

  fields :name, :value
end
