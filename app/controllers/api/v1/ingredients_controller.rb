module Api
  module V1
    class IngredientsController < ApiController
      enable_inclusions_for index: [:effect], show: [:effect]

      def index
        render json: {
          data: serialized_ingredients,
          included: serialized_effects,
          links: { self: api_v1_ingredients_url }
        }
      end

      def show
        render json: {
          data: serialized_ingredient,
          included: serialized_effect,
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

      def serialized_effects
        EffectSerializer.render_as_json(Effect.all) if inclusions.include?('effect')
      end

      def serialized_effect
        [EffectSerializer.render_as_json(ingredient.effect)] if inclusions.include?('effect')
      end
    end
  end
end
