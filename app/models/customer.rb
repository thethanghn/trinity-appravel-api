# == Schema Information
#
# Table name: customers
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_customers_on_name  (name)
#
class Customer < ApplicationRecord
  has_many :accounts, dependent: :destroy

  validates :name, uniqueness: true
end
