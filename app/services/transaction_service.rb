class TransactionService < ApplicationService
  attr_reader :sender, :receiver, :amount

  def initialize(params)
    @amount = params[:amount]
    @sender = Account.find params[:sender_id]
    @receiver = Account.find params[:receiver_id]
    raise "invalid account" if @sender.id == @receiver.id
  end
  
  def call
    raise "invalid amount" if @amount <= 0
    raise "not enough money" if @amount > @sender.balance
    ActiveRecord::Base.transaction do
      @sender.balance = @sender.balance - @amount
      @receiver.balance = @receiver.balance + @amount
      @sender.save!
      @receiver.save!
      trans = Transaction.create! amount: @amount, sender: @sender, receiver: @receiver
      return trans
    end
  end

end