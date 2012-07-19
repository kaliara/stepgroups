class Motion < ActiveRecord::Base
  belongs_to :document
  
  def pretty_passes
    passes ? 'Yes' : 'No'
  end
end
