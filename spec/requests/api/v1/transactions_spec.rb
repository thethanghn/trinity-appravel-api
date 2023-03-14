require 'swagger_helper'

describe 'transactions API' do

  path '/api/v1/transactions' do

    post 'Creates an transaction' do
      tags 'transactions'
      consumes 'application/json'
      parameter name: :transaction, in: :body, schema: {
        type: :object,
        properties: {
          amount: { type: :number },
          sender_id: { type: :integer },
          receiver_id: { type: :integer }
        },
        required: [ 'sender_id', 'receiver_id', 'amount' ]
      }

      response '201', 'transaction created' do
        let(:sender) {create(:account, balance: 500)}
        let(:receiver) {create(:account)}
        let(:transaction) { { amount: 100, sender_id: sender.id, receiver_id: receiver.id } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:sender) {create(:account, balance: 500)}
        let(:receiver) {create(:account)}
        let(:transaction) { { amount: -100, sender_id: sender.id, receiver_id: receiver.id } }
        run_test!
      end
    end

  end
end
