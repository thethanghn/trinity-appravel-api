# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TransactionService, type: :service do
  let(:amount) { 500 }
  let(:sender_id) { create(:account).id }
  let(:receiver_id) {create(:account).id}
  let(:params) { { amount: amount, sender_id: sender_id, receiver_id: receiver_id } }
  let(:service) { TransactionService.new(params) }

  describe '#call' do
    
    context 'invalid params' do
      context 'inavlid sender' do
        let(:sender_id) { 1000 }
        it 'raise not found error' do
          expect {
            service.call
          }.to raise_error(ActiveRecord::RecordNotFound)
        end
      end

      context 'inavlid receiver' do
        let(:receiver_id) { 1000 }
        it 'raise not found error' do
          expect {
            service.call
          }.to raise_error(ActiveRecord::RecordNotFound)
        end
      end

      context 'inavlid amount' do
        let(:amount) { -1000 }
        it 'raise inavlid' do
          expect {
            service.call
          }.to raise_error(StandardError)
        end
      end

      context 'not enough money' do
        let(:sender_id) { create(:account, balance: 100).id }
        let(:amount) { 101 }
        it 'raise not enough money' do
          expect {
            service.call
          }.to raise_error(StandardError)
        end
      end
    end

    context 'transfer success' do
      let(:amount) { 500 }
      let(:sender) { create(:account, balance: 1000) }
      let(:receiver) { create(:account, balance: 2000) }
      let(:sender_id) { sender.id }
      let(:receiver_id) {receiver.id}

      it 'transfers the money' do
        service.call
        expect(service.sender.balance).to eq 500
        expect(service.receiver.balance).to eq 2500
      end
    end
  end
end
