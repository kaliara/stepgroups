class ForumReply < ActiveRecord::Base
  include ActiveModel::Validations
  
  belongs_to :forum_post
  
  attr_accessor :antispam_value
  
  # validates_with Forum::ForumValidator
  validates_with AntispamValidator, :on => :create
end
