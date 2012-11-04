class ForumReply < ActiveRecord::Base
  belongs_to :forum_post
  
  attr_accessor :antispam_value
  
  # validates_with Forum::ForumValidator
  validates_captcha_with :antispam_value, :on => :create, :message => "must be answered correctly"
end
