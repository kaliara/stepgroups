class CreateSections < ActiveRecord::Migration
  def self.up
    create_table :sections do |t|
      t.integer :document_id
      t.string :heading
      t.text :body

      t.timestamps
    end
  end
  
  def self.down
    drop_table :sections
  end
end
