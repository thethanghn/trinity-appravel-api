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
FactoryBot.define do
  factory :customer do
    name { Faker::Name.name }
  end
end
