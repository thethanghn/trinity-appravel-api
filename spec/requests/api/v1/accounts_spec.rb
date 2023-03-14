require 'swagger_helper'

describe 'accounts API' do

  path '/api/v1/accounts' do

    get 'Get¸ all accounts' do
      tags 'Accounts'
      consumes 'application/json'

      response '200', 'accounts' do
        let(:account) { create(:account) }
        run_test!
      end
    end

    post 'Creates an account' do
      tags 'Accounts'
      consumes 'application/json'
      parameter name: :account, in: :body, schema: {
        type: :object,
        properties: {
          initial_deposit: { type: :number },
          bank_id: { type: :integer },
          customer_id: { type: :integer }
        },
        required: [ 'bank_id', 'customer_id', 'initial_deposit' ]
      }

      response '201', 'account created' do
        let(:bank) { create(:bank)}
        let(:customer) {create(:customer)}
        let(:account) { { initial_deposit: 1000.23, bank_id: bank.id, customer_id: customer.id } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:account) { { initial_deposit: 'xxx' } }
        run_test!
      end
    end

    path '/api/v1/accounts/{id}' do

      get 'Retrieves a account details' do
        tags 'Accounts'
        produces 'application/json'
        parameter name: :id, in: :path, type: :string
  
        response '200', 'account found' do
          schema type: :object,
            properties: {
              status: { type: :string },
              message: { type: :string },
              data: {
                type: :object,
                schema: { ref: '#/components/schemas/Account'}
              }
            }
  
          let!(:id) { create(:account).id }
          run_test!
        end
  
        response '404', 'account not found' do
          let(:id) { 'invalid' }
          run_test!
        end
      end
    end

    path '/api/v1/accounts/{id}/balance' do

      get 'Retrieves a account balance' do
        tags 'Accounts'
        produces 'application/json'
        parameter name: :id, in: :path, type: :string
  
        response '200', 'account found' do
          schema type: :object,
            properties: {
              status: { type: :string },
              message: { type: :string },
              data: {
                type: :object,
                properties: {
                  balance: { type: :number }
                }
              }
            }
  
          let!(:id) { create(:account).id }
          run_test!
        end
  
        response '404', 'account not found' do
          let(:id) { 'invalid' }
          run_test!
        end
      end
    end

    path '/api/v1/accounts/{id}/transactions' do

      get 'Retrieves a account transactions' do
        tags 'Accounts'
        produces 'application/json'
        parameter name: :id, in: :path, type: :string
        response '200', 'transactions found' do
          schema type: :object,
          properties: {
            status: { type: :string },
            message: { type: :string },
            data: {
              type: :array,
              items: { ref: '#/components/schemas/Transaction'}
            }
          }
  
          let!(:id) { create(:account).id }
          run_test!
        end
  
        response '404', 'account not found' do
          let(:id) { 'invalid' }
          run_test!
        end
      end
    end
  end
end
