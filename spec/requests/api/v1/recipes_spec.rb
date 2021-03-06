require 'rails_helper'

RSpec.describe 'Api::V1::Recipes', type: :request do
  let(:headers) { { 'ACCEPT': 'application/json' } }

  describe 'POST recipe' do
    subject(:post_recipe) do
      post '/api/v1/recipes', params: params, headers: headers
    end

    let!(:ingredients) { Ingredient.take(5) }

    let(:params) do
      {
        data: {
          type: 'recipes',
          relationships: {
            ingredients: ingredients.map do |ingredient|
              { data: { type: 'ingredients', id: ingredient.id } }
            end
          }
        }
      }
    end

    it 'returns a new recipe' do
      post_recipe

      most_recent_recipe = Recipe.order(created_at: :desc).first

      expect(response).to have_http_status :created
      expect(response).to render_primary_resource most_recent_recipe
      expect(response).to have_top_level_links(self: "/recipes/#{most_recent_recipe.id}")
    end

    it 'executes a limited number of queries' do
      expect { post_recipe }.not_to exceed_query_limit(16)
    end

    context 'recipe already exists' do
      let!(:existing_recipe) do
        Recipe.create(ingredients: ingredients, ingredients_key: Recipe.generate_key(ingredients))
      end

      it 'returns the existing recipe' do
        post_recipe

        expect(response).to have_http_status :created
        expect(response).to render_primary_resource existing_recipe
      end

      it 'executes a limited number of queries' do
        expect { post_recipe }.not_to exceed_query_limit(4)
      end
    end
  end

  describe 'GET recipes/{id}' do
    subject(:get_recipe) do
      get "/api/v1/recipes/#{recipe.id}", params: params, headers: headers
    end

    let!(:recipe) do
      Recipe.create(ingredients: ingredients, ingredients_key: Recipe.generate_key(ingredients))
    end

    let!(:ingredients) { Ingredient.take(rand(1..5)) }
    let(:params) { {} }

    it 'returns a recipe' do
      get_recipe

      expect(response).to have_http_status :ok
      expect(response).to render_primary_resource recipe
      expect(response).to have_top_level_links(self: "/recipes/#{recipe.id}")
    end

    it 'executes four queries' do
      expect { get_recipe }.not_to exceed_query_limit(4)
    end

    describe 'resource inclusion' do
      context 'ingredients' do
        let(:params) { { include: 'ingredients' } }

        it 'can return the associated ingredients' do
          get_recipe

          expect(response).to render_included_resources ingredients
        end

        it 'executes four queries' do
          expect { get_recipe }.not_to exceed_query_limit(4)
        end
      end

      context 'dishes' do
        let(:params) { { include: 'dishes' } }

        let!(:dishes) do
          [
            Dish.create(
              recipes: [recipe],
              hearts: 2,
              value: 10,
              effect: Effect.first,
              effect_potency: 1
            )
          ]
        end

        it 'can return the associated dishes' do
          get_recipe

          expect(response).to render_included_resources dishes
        end

        it 'executes five queries' do
          expect { get_recipe }.not_to exceed_query_limit(5)
        end
      end
    end
  end
end
