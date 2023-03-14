class AccountService < ApplicationService
  def initialize(params)
    @params = params
    @bank = Bank.find params[:bank_id]
    @customer = Customer.find params[:customer_id]
  end

  def call
    acc = Account.new @params
    acc.balance = acc.initial_deposit
    acc.account_number = gen_account_number
    acc.save!
    acc
  end

  private
  def gen_account_number(digits: 10)
    output = ''

    output += rand.to_s[2..] while output.length < digits

    output[0...digits]
  end
end