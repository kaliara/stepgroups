class Page < ActiveRecordExtension
  scope :published, where('published = ?', 1)
end
