class CreateDocumentSections < ActiveRecord::Migration
  def self.up
    create_table :document_sections do |t|
      t.integer :document_id
      t.string :heading
      t.text :body

      t.timestamps
    end
    
    # add autosave sections as first 5 entries
    5.times do 
      DocumentSection.new(:document_id => 1, :heading => 'Autosave Section', :body => 'Used for autosaving purposes').save
    end
  end
  
  def self.down
    drop_table :document_sections
  end
end
