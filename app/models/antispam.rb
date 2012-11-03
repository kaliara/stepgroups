class Anitspam
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  # 
  # attr_accessor :name
end

class AntispamValidator < ActiveModel::Validator
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
