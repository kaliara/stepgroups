class CreateSections < ActiveRecord::Migration
  def self.up
    create_table :sections do |t|
      t.integer :document_id
      t.string :heading
      t.text :body

      t.timestamps
    end
    
    # add autosave sections as first 5 entries
    5.times do 
      Section.new(:document_id => 1, :heading => 'Autosave Section', :body => 'Used for autosaving purposes').save
    end
  end
  
  def self.down
    drop_table :sections
  end
end
