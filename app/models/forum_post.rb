class ForumPost < ActiveRecord::Base
  belongs_to :forum
  has_many :forum_replies
  
  scope :recent, order("created_at desc").limit(5)
  
  validates_with Forum::ForumValidator
  validates :forum_id, :inclusion => { :in => Forum.active.collect{|f| f.id}, :message => "is either not allowing new posts or is hidden", :on => :create }
  
  def total_replies
    ForumReply.where("forum_post_id = ?", self.id).count
  end
end
