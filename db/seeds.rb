FB = FactoryBot
5.times do
  c = FB.create :customer
end
customers = Customer.all.to_a

5.times do
  b = FB.create :bank
end
banks = Bank.all.to_a

customers.each do |c|
  acc = FB.create :account, customer: c, bank: banks.sample
end
