module Api
  module V1
    class IngredientsController < ApiController
      def index
        render json: {
          data: serialized_ingredients,
          links: { self: api_v1_ingredients_url }
        }
      end

      def show
        render json: {
          data: serialized_ingredient,
          links: { self: api_v1_ingredient_url(ingredient) }
        }
      end

      private

      def serialized_ingredients
        IngredientSerializer.render_as_json(Ingredient.all)
      end

      def serialized_ingredient
        IngredientSerializer.render_as_json(ingredient)
      end

      def ingredient
        Ingredient.find(params[:id])
      end
    end
  end
end
