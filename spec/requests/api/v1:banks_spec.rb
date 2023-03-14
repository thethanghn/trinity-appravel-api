require 'swagger_helper'

describe 'banks API' do

  path '/api/v1/banks' do

    get 'Get¸ all banks' do
      tags 'banks'
      consumes 'application/json'

      response '200', 'banks' do
        let(:bank) { create(:bank) }
        run_test!
      end

      response '422', 'invalid request' do
        let(:bank) { create(:bank) }
        run_test!
      end
    end
  end
end
