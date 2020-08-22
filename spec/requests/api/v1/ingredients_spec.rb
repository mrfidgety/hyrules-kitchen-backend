require 'rails_helper'

RSpec.describe 'Api::V1::Ingredients', type: :request do
  describe 'GET ingredients' do
    subject(:get_ingredients) do
      get '/api/v1/ingredients', headers: { 'ACCEPT': 'application/json' }
    end

    it 'returns all ingredients' do
      get_ingredients

      expect(response).to have_http_status :ok
      expect(response).to render_primary_resources Ingredient.all
      expect(response).to have_top_level_links(self: '/ingredients')
    end
  end

  describe 'GET ingredients/{id}' do
    subject(:get_ingredient) do
      get "/api/v1/ingredients/#{ingredient.id}", headers: { 'ACCEPT': 'application/json' }
    end

    let(:ingredient) { Ingredient.joins(:effect).take }

    it 'returns an ingredient' do
      get_ingredient

      expect(response).to have_http_status :ok
      expect(response).to render_primary_resource ingredient
      expect(response).to have_top_level_links(self: "/ingredients/#{ingredient.id}")
    end
  end
end
