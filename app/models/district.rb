class District < ActiveRecord::Base
  has_many :meetings
  
  default_scope order('name ASC')
end
