require 'rails_helper'

RSpec.describe 'Api::V1::Ingredients', type: :request do
  describe 'GET ingredients' do
    subject(:get_ingredients) do
      get '/api/v1/ingredients', headers: { 'ACCEPT': 'application/json' }
    end

    it 'returns all ingredients' do
      get_ingredients

      serailized_object_ids = JSON.parse(response.body)['data'].map { |item| item['id'] }

      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response).to have_http_status :ok
      expect(serailized_object_ids).to match_array Ingredient.all.map(&:id)
    end
  end
end
