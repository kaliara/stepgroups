class Page < ActiveRecord::Base
  scope :published, where('published = ?', 1)
end
