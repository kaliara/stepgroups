class ForumReply < ActiveRecord::Base
  belongs_to :forum_post
  
  attr_accessor :antispam_value
  
  # validates_with Forum::ForumValidator
  validates_captcha_with :antispam_value, :on => :create, :message => "must be answered correctly"
  validates :body, :presence => true
  
  after_create :update_parent_post
  
  def update_parent_post
    self.forum_post.touch
  end
end
