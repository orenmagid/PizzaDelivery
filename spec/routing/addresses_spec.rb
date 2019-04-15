require 'rails_helper'

describe 'addresses routes' do
  it 'should route to addresses index' do
    expect(get('/api/v1/addresses')).to route_to('api/v1/addresses#index')
  end

  it 'should route to addresses show' do
    expect(get('/api/v1/addresses/1')).to route_to('/api/v1/addresses#show', id: '1')
  end
end
