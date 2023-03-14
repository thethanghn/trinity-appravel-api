class Api::V1::TransactionsController < ApplicationController
  def create
    begin
      transaction = TransactionService.call transaction_params
      render json: {status: 'SUCCESS', message: 'transaction created', data: transaction}, status: :created
    rescue StandardError => error
      render json: {status: 'FAILURE', message: 'invalid request', data: nil}, status: :unprocessable_entity
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:sender_id, :receiver_id, :amount)
  end
end
