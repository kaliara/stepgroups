class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :from
      t.string :reply_to
      t.string :subject
      t.text :body

      t.timestamps
    end
  end
end
