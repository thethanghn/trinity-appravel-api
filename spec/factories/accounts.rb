FactoryBot.define do
  factory :account do
    account_number { Faker::Bank.account_number(digits: 10) }
    association :bank, factory: :bank
    association :customer, factory: :customer
  end
end
