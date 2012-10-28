class Forum < ActiveRecord::Base
  has_many :forum_posts
  scope :visible, where("visible = ?", 1)
  scope :active, where("allow_new_posts = ?", 1)
  
  def total_posts
    ForumPost.where("forum_id = ?", self.id).count
  end
end

class ForumValidator < ActiveModel::Validator
  def validate(record)
    # text = record.body.to_s + (record.title if defined? record.title).to_s
    # if text.match /crap/
    #   record.errors[:base] << "Message contains inappropriate language, please remove it."
    # end
    # if text.match /((\(\d{3}\))|(\d{3}-?))\d{3}-?\d{4}/
    #   record.errors[:base] << "Message contains a phone number, please remove it."
    # end
  end
end
