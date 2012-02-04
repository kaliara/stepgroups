class DocumentSection < ActiveRecord::Base
  default_scope where('document_id > 1')
end
