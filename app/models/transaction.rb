class Transaction < ActiveRecordExtension
  belongs_to :document
  
  METHODS = [['unknown',0], ['cash',1], ['check',2], ['debit',3], ['credit',4], ['electronic',5]]
  
  def pretty_method
    METHODS[method].first
  end
  
  def pretty_timestamp
    timestamp.strftime "%b %d, %Y"
  end
  
  def pretty_amount
    expense? ? (-1 * amount) : amount
  end
end
