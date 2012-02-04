class Motion < ActiveRecord::Base
  belongs_to :document
  
  def pretty_passes
    passes ? 'Yes' : 'N\o'
  end
end
