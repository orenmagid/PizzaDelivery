require 'swagger_helper'
require 'date'

describe 'Orders API' do
  path '/api/v1/orders' do
    post 'Creates an order' do
      tags 'Orders'
      consumes 'application/json'
      parameter name: :order, in: :body, schema: {
        type: :object,
        properties: {
          user_id: { type: :integer },
          order_items: { type: :array },
          address_id: { type: :integer },
          date_time: { type: :string }
        },
        required: %w[user_id address_id date_time]
      }

      response '201', 'order created' do
        let(:order) { { user_id: 2, address_id: 3, date_time: DateTime.new, order_items: [pizza_type_id: 2, quantity: 1] } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:order) { { name: 'foo' } }
        run_test!
      end
    end
  end

  path '/api/v1/orders/{id}' do
    get 'Retrieves an order' do
      tags 'Orders'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'name found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 photo_url: { type: :string },
                 status: { type: :string }
               },
               required: %w[id name status]

        let(:id) { Pet.create(name: 'foo', status: 'bar', photo_url: 'http://example.com/avatar.jpg').id }
        run_test!
      end

      response '404', 'order not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
