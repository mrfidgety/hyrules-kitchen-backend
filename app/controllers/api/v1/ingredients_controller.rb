module Api
  module V1
    class IngredientsController < ApiController
      enable_inclusions_for index: [:effect], show: [:effect]

      def index
        base_response = {
          data: serialized_ingredients,
          links: { self: api_v1_ingredients_url }
        }

        render json: base_response.merge(serialized_inclusions)
      end

      def show
        base_response = {
          data: serialized_ingredient,
          links: { self: api_v1_ingredient_url(ingredient) }
        }

        render json: base_response.merge(serialized_inclusions)
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

      def serialized_inclusions
        return {} unless inclusions.any?

        { included: serialized_effects }
      end

      def serialized_effects
        return unless inclusions.include?('effect')

        effects = action_name == 'show' ? [ingredient.effect] : Effect.all

        EffectSerializer.render_as_json(effects, view: :basic)
      end
    end
  end
end
