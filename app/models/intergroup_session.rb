class IntergroupSession < ActiveRecord::Base
  has_many :documents
  has_many :motions, :through => :documents
  # has_many :transactions, :through => :documents
  
  default_scope order('session_date desc')
  
  def name
    session_date.strftime("%B %Y") + " Intergroup Session"
  end
  
  def self.past_meeting
    IntergroupSession.where("session_date < ?", Date.today).first
  end
end
