class Content < ActiveRecordExtension
  validates :name, :presence => true, :uniqueness => true
  validates :value, :presence => true
end