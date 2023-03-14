# == Schema Information
#
# Table name: transactions
#
#  id          :integer          not null, primary key
#  amount      :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  receiver_id :integer          not null
#  sender_id   :integer          not null
#
# Indexes
#
#  index_transactions_on_receiver_id  (receiver_id)
#  index_transactions_on_sender_id    (sender_id)
#
# Foreign Keys
#
#  receiver_id  (receiver_id => accounts.id)
#  sender_id    (sender_id => accounts.id)
#
FactoryBot.define do
  factory :transaction do
    amount { Faker::Number.decimal(l_digits: 2) }
    association :sender, factory: :account
    association :receiver, factory: :account
  end
end
