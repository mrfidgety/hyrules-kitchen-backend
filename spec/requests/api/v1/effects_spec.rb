require 'rails_helper'

RSpec.describe 'Api::V1::Effects', type: :request do
  let(:headers) { { 'ACCEPT': 'application/json' } }

  describe 'GET effects' do
    subject(:get_effects) do
      get '/api/v1/effects', params: params, headers: headers
    end

    let(:params) { {} }

    it 'returns all effects' do
      get_effects

      expect(response).to have_http_status :ok
      expect(response).to render_primary_resources Effect.all
      expect(response).to have_top_level_links(self: '/effects')
    end

    it 'executes two queries' do
      expect { get_effects }.not_to exceed_query_limit(2)
    end

    describe 'resource inclusion' do
      let(:params) { { include: 'ingredients' } }

      it 'can return the associated ingredients' do
        get_effects

        expect(response).to render_included_resources Ingredient.joins(:effect)
      end

      it 'executes two queries' do
        expect { get_effects }.not_to exceed_query_limit(2)
      end
    end
  end

  describe 'GET effects/{id}' do
    subject(:get_effect) do
      get "/api/v1/effects/#{effect.id}", params: params, headers: headers
    end

    let!(:effect) { Effect.take }
    let(:params) { {} }

    it 'returns an effect' do
      get_effect

      expect(response).to have_http_status :ok
      expect(response).to render_primary_resource effect
      expect(response).to have_top_level_links(self: "/effects/#{effect.id}")
    end

    it 'executes two queries' do
      expect { get_effect }.not_to exceed_query_limit(2)
    end

    describe 'resource inclusion' do
      let(:params) { { include: 'ingredients' } }

      it 'can return the associated ingredients' do
        get_effect

        expect(response).to render_included_resources effect.ingredients
      end

      it 'executes two queries' do
        expect { get_effect }.not_to exceed_query_limit(2)
      end
    end
  end
end
