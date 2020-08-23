require 'rails_helper'

RSpec.describe 'Api::V1::Ingredients', type: :request do
  let(:headers) { { 'ACCEPT': 'application/json' } }

  describe 'GET ingredients' do
    subject(:get_ingredients) do
      get '/api/v1/ingredients', params: params, headers: headers
    end

    let(:params) { {} }

    it 'returns all ingredients' do
      get_ingredients

      expect(response).to have_http_status :ok
      expect(response).to render_primary_resources Ingredient.all
      expect(response).to have_top_level_links(self: '/ingredients')
    end

    it 'executes one query' do
      expect { get_ingredients }.not_to exceed_query_limit(1)
    end

    describe 'resource inclusion' do
      let(:params) { { include: 'effect' } }

      it 'can return the associated effect' do
        get_ingredients

        expect(response).to render_included_resources Effect.all
      end

      it 'executes two queries' do
        expect { get_ingredients }.not_to exceed_query_limit(2)
      end
    end
  end

  describe 'GET ingredients/{id}' do
    subject(:get_ingredient) do
      get "/api/v1/ingredients/#{ingredient.id}", params: params, headers: headers
    end

    let!(:ingredient) { Ingredient.joins(:effect).take }
    let(:params) { {} }

    it 'returns an ingredient' do
      get_ingredient

      expect(response).to have_http_status :ok
      expect(response).to render_primary_resource ingredient
      expect(response).to have_top_level_links(self: "/ingredients/#{ingredient.id}")
    end

    it 'executes one query' do
      expect { get_ingredient }.not_to exceed_query_limit(1)
    end

    describe 'resource inclusion' do
      let(:params) { { include: 'effect' } }

      it 'can return the associated effect' do
        get_ingredient

        expect(response).to render_included_resource ingredient.effect
      end

      it 'executes two queries' do
        expect { get_ingredient }.not_to exceed_query_limit(2)
      end
    end
  end
end
