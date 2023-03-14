class AddAccountNumberToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :account_number, :string
    add_index :accounts, :account_number
  end
end
