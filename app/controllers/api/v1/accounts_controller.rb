class Api::V1::AccountsController < ApplicationController
  before_action :find_account, only: [:show, :balance, :transactions]

  def index
    @accounts = Account.all.order('created_at DESC')
    render json: {status: 'SUCCESS', message: 'accounts', data: @accounts}, status: :ok
  end

  def show
    render json: {status: 'SUCCESS', message: 'account', data: @account}, status: :ok
  end

  def create
    begin
      account = AccountService.call account_params
      render json: {status: 'SUCCESS', message: 'account created', data: account}, status: :created
    rescue StandardError => error
      render json: {status: 'FAILURE', message: 'invalid request', data: nil}, status: :unprocessable_entity
    end
  end

  def balance
    render json: {status: 'SUCCESS', message: 'account balance', data: {balance: @account.balance }}, status: :ok
  end

  def transactions
    @transactions = @account.sent_transactions.order('created_at DESC')
    render json: {status: 'SUCCESS', message: 'history', data: @transactions}, status: :ok
  end

  private

  def account_params
    params.require(:account).permit(:bank_id, :customer_id, :initial_deposit)
  end

  def find_account
    @account = Account.find params[:id]
  end
end
