require 'rails_helper'

describe Api::V1::AddressesController do
  before { request.headers['authorization'] = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyfQ.954yktgo75GYlrGXI__8rV5g3j7C_pfowdD96513HmE' }

  describe '#index' do
    it 'should return success response' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'should return proper json' do
      create_list :address, 2
      get :index
      json = JSON.parse(response.body)

      Address.recent.each_with_index do |_address, _index|
        expect(json[0]['location']).to eq(
          '2475 Virginia Ave NW, Washington, DC 20037'
        )

        expect(json[1]['location']).to eq(
          '2475 Virginia Ave NW, Washington, DC 20037'
        )
      end
    end
    it 'should return addresses in the proper order' do
      old_address = create :address, user_id: 2
      newer_address = create :address, user_id: 2

      get :index
      json = JSON.parse(response.body)

      expect(json.first['id']).to eq(newer_address.id)
      expect(json.second['id']).to eq(old_address.id)
      expect(json.last['id']).to eq(1)
    end
  end

  describe '#show' do
    let(:address) { create :address, user_id: 3 }
    subject { get :show, params: { id: address.id } }

    it 'should return success response' do
      subject
      expect(response).to have_http_status(:ok)
    end

    it 'should return proper json' do
      subject
      json = JSON.parse(response.body)
      expect(json['location']).to eq(
        address.location
      )
    end
  end

  describe '#create' do
    subject { post :create }

    context 'when invalid parameters provided' do
      let(:invalid_attributes) do
        { address: { location: '', user_id: '45433' } }
      end

      subject { post :create, params: invalid_attributes }

      it 'should return 422 status code' do
        subject
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'should return proper error json' do
        subject
        json = JSON.parse(response.body)
        expect(json['errors']).to include(
          'User must exist'
        )
        expect(json['errors']).to include(
          "User can't be blank"
        )
        expect(json['errors']).to include(
          "Location can't be blank"
        )
      end
    end

    context 'when success request sent' do
      let(:valid_attributes) do
        { address: { location: 'The Watergate Hotel', user_id: 1 } }
      end

      subject { post :create, params: valid_attributes }

      it 'should have 201 status code' do
        subject
        expect(response).to have_http_status(:created)
      end

      it 'should have proper json body' do
        subject
        json = JSON.parse(response.body)
        expect(json['location']).to include(
          valid_attributes[:address][:location]
        )
      end

      it 'should create the article' do
        expect { subject }.to change { Address.count }.by(1)
      end
    end
  end
end
