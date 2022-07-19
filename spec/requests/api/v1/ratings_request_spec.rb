require 'rails_helper'

RSpec.describe "Api::V1::Ratings", type: :request do
  describe "GET /ratings" do
    let(:url) { "/api/v1/ratings" }
    let!(:ratings) { create(:rating) }

    it "returns all Banks" do
      get url
      expect(body_json['ratings']).not_to be_empty
    end

    it "returns success status" do
      get url
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /api/v1/ratings" do
    # valid bank
    let!(:store) { create(:store) }
    let(:valid_params) { { store_id: :store, value: 5, opinion: 'Muito bom!', name: 'Ueverton Oliveira' } }

    context 'when the request is valid' do
      before { post '/api/v1/ratings', params: valid_params }

      it 'create a bank' do
        expect(body_json['rating']['value']).to eq(5)
        expect(body_json['rating']['opinion']).to eq('Muito bom!')
        expect(body_json['rating']['user_name']).to eq('Ueverton Oliveira')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end

  describe "DELETE /ratings" do
    let(:url) { "/api/v1/ratings/#{rating.id}" }
    let!(:rating) { create(:rating) }

    it 'removes Rating' do
      headers = { "ACCEPT" => "application/json" }

      expect do
        delete url, headers: headers
      end.to change(Rating, :count).by(-1)
    end

    it 'returns success status' do
      headers = { "ACCEPT" => "application/json" }

      delete url, headers: headers
      expect(response).to have_http_status(:no_content)
    end
  end
end
