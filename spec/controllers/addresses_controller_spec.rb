require 'rails_helper'

describe Api::V1::AddressesController do
  before { request.headers['authorization'] = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyfQ.954yktgo75GYlrGXI__8rV5g3j7C_pfowdD96513HmE' }

  describe '#index' do
    it 'should return success response' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'should return proper json' do
      get :index
      json = JSON.parse(response.body)

      Address.recent(2).each_with_index do |_address, _index|
        expect(json[0]['location']).to eql(
          '1255 23rd St NW, Washington, DC 20037'
        )
        expect(json[1]['location']).to eql(
          '2475 Virginia Ave. NW, Washington, DC 20037'
        )
      end

      it 'should return articles in the proper order' do
        old_article = create :article
        newer_article = create :article
        subject
        expect(json_data.first['id']).to eq(newer_article.id.to_s)
        expect(json_data.last['id']).to eq(old_article.id.to_s)
      end
    end
  end
end
