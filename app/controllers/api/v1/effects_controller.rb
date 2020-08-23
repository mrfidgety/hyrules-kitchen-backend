module Api
  module V1
    class EffectsController < ApiController
      enable_inclusions_for index: [:ingredients], show: [:ingredients]

      def index
        render json: {
          data: serialized_effects,
          included: serialized_ingredients,
          links: { self: api_v1_effects_url }
        }
      end

      def show
        render json: {
          data: serialized_effect,
          included: serialized_ingredients,
          links: { self: api_v1_effect_url(effect) }
        }
      end

      private

      def serialized_effects
        EffectSerializer.render_as_json(effects)
      end

      def serialized_effect
        EffectSerializer.render_as_json(effect)
      end

      def effect
        Effect.includes(:ingredients).find(params[:id])
      end

      def effects
        Effect.includes(:ingredients).all
      end

      def serialized_ingredients
        return unless inclusions.include?('ingredients')

        IngredientSerializer.render_as_json(ingredients, view: :basic)
      end

      def ingredients
        action_name == 'show' ? effect.ingredients : effects.map(&:ingredients).flatten
      end
    end
  end
end
