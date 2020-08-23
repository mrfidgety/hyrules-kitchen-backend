module Api
  module V1
    class EffectsController < ApiController
      enable_inclusions_for index: [:ingredients], show: [:ingredients]

      def index
        base_response = {
          data: serialized_effects,
          links: { self: api_v1_effects_url }
        }

        render json: base_response.merge(serialized_inclusions)
      end

      def show
        base_response = {
          data: serialized_effect,
          links: { self: api_v1_effect_url(effect) }
        }

        render json: base_response.merge(serialized_inclusions)
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

      def serialized_inclusions
        return {} unless inclusions.any?

        { included: serialized_ingredients }
      end

      def serialized_ingredients
        return unless inclusions.include?('ingredients')

        ingredients =
          if action_name == 'show'
            effect.ingredients
          else
            effects.map(&:ingredients).flatten
          end

        IngredientSerializer.render_as_json(ingredients, view: :basic)
      end
    end
  end
end
