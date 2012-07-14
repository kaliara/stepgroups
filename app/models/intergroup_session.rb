class IntergroupSession < ActiveRecordExtension
  has_many :documents
  has_many :motions, :through => :documents
  
  default_scope order('session_date desc')
  
  def name
    session_date.strftime("%B %Y") + " Intergroup Session"
  end
end
