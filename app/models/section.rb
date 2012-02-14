class Section < ActiveRecord::Base
  belongs_to :document
  
  default_scope where('document_id > 1')
end
