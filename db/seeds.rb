# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Document Autosave entry
Document.new(:id => 1, :title => 'Autosave').save

# Section Autosave entries
10.times do |i| 
  Section.new(:id => i, :document_id => 1, :heading => 'Autosave Section', :body => 'Used for autosaving purposes').save
end

# Page Autosave entry
Page.new(:id => 1, :name => 'Autosave', :content => 'Used for autosaving purposes').save