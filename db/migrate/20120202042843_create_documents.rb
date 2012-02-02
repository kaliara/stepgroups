class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      t.integer :intergroup_session_id
      t.string :title
      t.integer :document_type, :default => 0

      t.timestamps
    end
    
    # add autosave document as first entry
    Document.new(:title => 'Autosave').save
  end
  
  def self.down
    drop_table :documents
  end
end
