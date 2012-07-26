class Content < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true, :format => { :with => /^[\w\d\_]+$/, :message => "can contain only letters, numbers and underscores ('_')" }
  validates :value, :presence => true
  
  default_scope where("published = 1")
end