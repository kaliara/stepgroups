class Document < ActiveRecord::Base
  belongs_to :intergroup_session
  has_many :sections
  has_many :motions
  has_many :transactions
  
  TYPES = [['normal', 0], ['minutes', 1]];
  
  def pretty_document_type
    TYPES[document_type][0]
  end
end
