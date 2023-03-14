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
class Transaction < ApplicationRecord
  belongs_to :sender, class_name: "Account", foreign_key: 'sender_id'
  belongs_to :receiver, class_name: "Account", foreign_key: 'receiver_id'
end
