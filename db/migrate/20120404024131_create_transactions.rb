class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :document_id
      t.decimal :amount, :default => 0, :precision => 10, :scale => 2
      t.integer :method, :default => 0
      t.boolean :expense, :default => 0
      t.datetime :timestamp
      t.string :description

      t.timestamps
    end
  end
end
