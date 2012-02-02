class CreateMotions < ActiveRecord::Migration
  def change
    create_table :motions do |t|
      t.integer :document_id
      t.string :title
      t.text :body
      t.integer :vote_yes, :default => 0
      t.integer :vote_no, :default => 0
      t.integer :vote_abstain, :default => 0
      t.boolean :passes, :default => false

      t.timestamps
    end
  end
end
