module Api
  module V1
    class RecipesController < ApiController
      enable_inclusions_for show: [:ingredients, :dishes]

      def create
        create_recipe

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

      def create_recipe
        @recipe = CreateRecipe.perform(ingredients: ingredients).recipe
      end

      def find_recipe
        @recipe = Recipe.includes(:ingredients, :dishes).find(params[:id])
      end

      def serialized_recipe
        RecipeSerializer.render_as_json(recipe)
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

        { included: serialized_ingredients + serialized_dishes }
      end

      def serialized_ingredients
        return [] unless inclusions.include?('ingredients')

        IngredientSerializer.render_as_json(recipe.ingredients, view: :basic)
      end

      def serialized_dishes
        return [] unless inclusions.include?('dishes')

        DishSerializer.render_as_json(recipe.dishes)
      end
    end
  end
end
