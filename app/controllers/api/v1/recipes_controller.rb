module Api
  module V1
    class RecipesController < ApiController
      enable_inclusions_for show: [:ingredients]

      def create
        find_or_create_recipe

        base_response = {
          data: serialized_recipe,
          links: { self: api_v1_recipe_url(recipe) }
        }

        render status: :created, json: base_response
      end

      def show
        find_recipe

        base_response = {
          data: serialized_recipe,
          links: { self: api_v1_recipe_url(recipe) }
        }

        render json: base_response.merge(serialized_inclusions)
      end

      private

      attr_reader :recipe

      def find_or_create_recipe
        @recipe = Recipe.find_by(ingredients_key: ingredients_key) ||
                  Recipe.create(ingredients: ingredients, ingredients_key: ingredients_key)
      end

      def find_recipe
        @recipe = Recipe.includes(:ingredients).find(params[:id])
      end

      def serialized_recipe
        RecipeSerializer.render_as_json(recipe)
      end

      def ingredients_key
        @ingredients_key ||= Recipe.generate_key(ingredients)
      end

      def ingredient_ids
        recipe_params[:relationships][:ingredients].map do |ingredient_params|
          ingredient_params[:data][:id]
        end
      end

      def ingredients
        Ingredient.find(ingredient_ids)
      end

      def recipe_params
        params.require(:data)
      end

      def serialized_inclusions
        return {} unless inclusions.any?

        { included: serialized_ingredients }
      end

      def serialized_ingredients
        return unless inclusions.include?('ingredients')

        IngredientSerializer.render_as_json(recipe.ingredients, view: :basic)
      end
    end
  end
end
