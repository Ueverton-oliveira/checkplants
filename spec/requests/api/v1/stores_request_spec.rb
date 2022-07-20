require 'rails_helper'

RSpec.describe "Api::V1::Stores", type: :request do
  describe "GET /stores" do
    let(:url) { "/api/v1/stores" }
    let!(:stores) { create(:store) }

    it "returns all Stores" do
      get url
      expect(body_json['stores']).not_to be_empty
    end

    it "returns success status" do
      get url
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /api/v1/stores" do
    # valid store
    let(:valid_params) { { lonlat: '2112204 5649415', description: 'Store Miojo' } }

    context 'when the request is valid' do
      before { post '/api/v1/stores', params: valid_params }

      it 'create a store' do
        expect(body_json['store']['lonlat']).to eq('2112204 5649415')
        expect(body_json['store']['name']).to eq('Store Miojo')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end

  describe "DELETE /stores" do
    let(:url) { "/api/v1/stores/#{store.id}" }
    let!(:store) { create(:store) }

    it 'removes Store' do
      headers = { "ACCEPT" => "application/json" }

      expect do
        delete url, headers: headers
      end.to change(Store, :count).by(-1)
    end

    it 'returns success status' do
      headers = { "ACCEPT" => "application/json" }

      delete url, headers: headers
      expect(response).to have_http_status(:no_content)
    end
  end
end
