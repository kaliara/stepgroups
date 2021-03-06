class Message < ActiveRecord::Base
  attr_accessor :antispam_value
  
  # validates_presence_of :contact_details, :on => :create, :message => "must be entered"
  validates_presence_of :body, :on => :create, :message => " message can't be blank"
  validates_captcha_with :antispam_value, :on => :create, :message => "must be answered correctly"
end