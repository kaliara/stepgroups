class IntergroupSession < ActiveRecord::Base
  has_many :documents
  
  default_scope order('session_date desc')
  
  def name
    session_date.strftime("%B %Y") + " Intergroup Session"
  end
end
