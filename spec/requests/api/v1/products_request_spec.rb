require 'rails_helper'

RSpec.describe "Api::V1::Products", type: :request do
  describe "GET /products" do
    let(:url) { "/api/v1/products" }
    let!(:products) { create(:product) }

    it "returns all Products" do
      get url
      expect(body_json['products']).not_to be_empty
    end

    it "returns success status" do
      get url
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /api/v1/products" do
    # valid products
    let(:valid_params) { { store_id: :store, name: 'Miojo' } }

    context 'when the request is valid' do
      before { post '/api/v1/products', params: valid_params }

      it 'create a product' do
        expect(body_json['product']['name']).to eq('Miojo')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end

  describe "DELETE /products" do
    let(:url) { "/api/v1/products/#{product.id}" }
    let!(:product) { create(:product) }

    it 'removes product' do
      headers = { "ACCEPT" => "application/json" }

      expect do
        delete url, headers: headers
      end.to change(Product, :count).by(-1)
    end

    it 'returns success status' do
      headers = { "ACCEPT" => "application/json" }

      delete url, headers: headers
      expect(response).to have_http_status(:no_content)
    end
  end
end
