require 'rails_helper'

describe Api::V1::AddressesController do
  before { request.headers['authorization'] = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyfQ.954yktgo75GYlrGXI__8rV5g3j7C_pfowdD96513HmE' }

  describe '#index' do
    it 'should return success response' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'should return proper json, and in proper order' do
      create_list :address, 2
      get :index
      json = JSON.parse(response.body)

      Address.recent.each_with_index do |_address, _index|
        expect(json[0]['location']).to eq(
          '2475 Virginia Ave NW, Washington, DC 20037'
        )
        expect(json[0]['user_id']).to eq(
          2
        )
        expect(json[1]['location']).to eq(
          '2475 Virginia Ave NW, Washington, DC 20037'
        )
        expect(json[1]['user_id']).to eq(
          1
        )
        expect(json.last['user_id']).to eq(
          1
        )
      end
    end
  end
end
