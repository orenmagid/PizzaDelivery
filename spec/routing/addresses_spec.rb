require 'rails_helper'

describe 'addresses routes' do
  it 'should route to addresses index' do
    expect(get('/api/v1/addresses')).to route_to('api/v1/addresses#index')
  end

  it 'should route to addresses show' do
    expect(get('/api/v1/addresses/1')).to route_to('api/v1/addresses#show', id: '1')
  end

  it 'should route to addresses create' do
    expect(post('/api/v1/addresses')).to route_to('api/v1/addresses#create')
  end

  it 'should route to addresses update' do
    expect(put('/api/v1/addresses/1')).to route_to('api/v1/addresses#update', id: '1')
    expect(patch('/api/v1/addresses/1')).to route_to('api/v1/addresses#update', id: '1')
  end

  it 'should route to addresses destroy' do
    expect(delete('/api/v1/addresses/1')).to route_to('api/v1/addresses#destroy', id: '1')
  end
end
