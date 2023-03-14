require 'swagger_helper'

describe 'Customers API' do

  path '/api/v1/customers' do

    get 'Get¸ all customers' do
      tags 'Customers'
      consumes 'application/json'

      response '200', 'customers' do
        let(:customer) { create(:customer) }
        run_test!
      end

      response '422', 'invalid request' do
        let(:customer) { create(:customer) }
        run_test!
      end
    end
  end
end
