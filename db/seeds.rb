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
accounts = Account.all.to_a

rand(100).times do
  acc1 = accounts.sample
  acc2 = accounts.sample
  trans = FB.create(:transaction, sender: acc1, receiver: acc2) if acc1.id != acc2.id
end