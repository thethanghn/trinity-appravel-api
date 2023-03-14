class Api::V1::CustomersController < ApplicationController
  def index
    @customers = Customer.all.order('created_at DESC')
    render json: {status: 'SUCCESS', message: 'Customers', data: @customers}, status: :ok
  end
end
