class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.references :sender, null: false, foreign_key: { to_table: :accounts }
      t.references :receiver, null: false, foreign_key: { to_table: :accounts }
      t.float :amount

      t.timestamps
    end
  end
end
