module Api
  module V1
    class IngredientsController < ApiController
      def index
        render json: {
          data: serialized_ingredients
        }
      end

      private

      def serialized_ingredients
        IngredientSerializer.render_as_json Ingredient.all
      end
    end
  end
end
