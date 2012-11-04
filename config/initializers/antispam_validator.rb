ActiveRecord::Base.class_eval do
  def self.validates_captcha_with(attr_name, options={})
    validates attr_name, :numericality => { :equal_to => (Date.today.day / 10 + 1) + (Date.today.wday + 1) }.merge!(options)
  end
end