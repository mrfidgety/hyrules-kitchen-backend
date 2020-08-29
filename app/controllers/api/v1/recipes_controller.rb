module Api
  module V1
    class RecipesController < ApiController
      def create
        recipe = find_or_create_recipe

        base_response = {
          data: serialized_recipe(recipe),
          links: { self: api_v1_recipe_url(recipe) }
        }

        render status: :created, json: base_response.merge(serialized_inclusions)
      end

      def show
        recipe = Recipe.find(params[:id])

        base_response = {
          data: serialized_recipe(recipe),
          links: { self: api_v1_recipe_url(recipe) }
        }

        render json: base_response.merge(serialized_inclusions)
      end

      private

      def find_or_create_recipe
        Recipe.find_by(ingredients_key: ingredients_key) ||
          Recipe.create(ingredients: ingredients, ingredients_key: ingredients_key)
      end

      def ingredients_key
        @ingredients_key ||= Recipe.generate_key(ingredients)
      end

      def serialized_recipe(recipe)
        RecipeSerializer.render_as_json(recipe)
      end

      def serialized_inclusions
        {}
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
    end
  end
end
