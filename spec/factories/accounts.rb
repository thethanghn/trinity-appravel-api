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
FactoryBot.define do
  factory :account do
    account_number { Faker::Bank.account_number(digits: 10) }
    initial_deposit { Faker::Number.decimal(l_digits: 2) }
    balance { Faker::Number.decimal(l_digits: 2) }
    association :bank, factory: :bank
    association :customer, factory: :customer
  end
end
