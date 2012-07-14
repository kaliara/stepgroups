class District < ActiveRecordExtension
  has_many :meeting_addresses
  
  default_scope order('name ASC')
end
