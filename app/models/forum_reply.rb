class ForumReply < ActiveRecord::Base
  belongs_to :forum_post
  
  validates_with Forum::ForumValidator
end
