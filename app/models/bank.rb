# == Schema Information
#
# Table name: banks
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_banks_on_name  (name)
#
class Bank < ApplicationRecord
  has_many :accounts, dependent: :destroy
end
