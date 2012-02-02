class Document < ActiveRecord::Base
  belongs_to :intergroup_session
  
  TYPES = [['Normal', 0], ['Minutes', 1], ['Treasury', 2]];
  
  def pretty_document_type
    TYPES[document_type][0]
  end
end
