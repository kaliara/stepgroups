ActiveRecord::Base.class_eval do
  def self.validates_captcha_with(attr_name, options={})
    validates attr_name, :numericality => { :equal_to => ([Message.count.to_s][-1].to_i) + (Message.count.odd? ? 2 : 3) }.merge!(options)
  end
end