require 'rails_helper'

describe Api::V1::AddressesController do
  before { request.headers['authorization'] = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyfQ.954yktgo75GYlrGXI__8rV5g3j7C_pfowdD96513HmE' }

  describe '#index' do
    it 'should return success response' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'should return proper json' do
      # create_list :address, 2
      # get :index
      # json = JSON.parse(response.body)
      # address = json['address']
      # expect(json_data.length).to eq(2)
      # expect(json_data[0]['attributes']).to eq(
      #   'title' => 'My awesome article 1',
      #   'content' => 'The content of my awesome article 1',
      #   'slug' => 'my-awesome-article-1'
      # )
      # expect(json_data[1]['attributes']).to eq(
      #   'title' => 'My awesome article 2',
      #   'content' => 'The content of my awesome article 2',
      #   'slug' => 'my-awesome-article-2'
      # )
    end
  end
end
