# == Schema Information
#
# Table name: accounts
#
#  id              :integer          not null, primary key
#  account_number  :string
#  balance         :float
#  initial_deposit :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  bank_id         :integer          not null
#  customer_id     :integer          not null
#
# Indexes
#
#  index_accounts_on_account_number  (account_number)
#  index_accounts_on_bank_id         (bank_id)
#  index_accounts_on_customer_id     (customer_id)
#
# Foreign Keys
#
#  bank_id      (bank_id => banks.id)
#  customer_id  (customer_id => customers.id)
#
class Account < ApplicationRecord
  belongs_to :bank
  belongs_to :customer
  has_many :sent_transactions, class_name: 'Transaction', foreign_key: :sender_id
  has_many :received_transactions, class_name: 'Transaction', foreign_key: :receiver_id

  validates :account_number, uniqueness: true
end
