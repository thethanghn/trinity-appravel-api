class Api::V1::BanksController < ApplicationController
  def index
    @banks = Bank.all.order('created_at DESC')
    render json: {status: 'SUCCESS', message: 'banks', data: @banks}, status: :ok
  end
end


