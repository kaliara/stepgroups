class Message < ActiveRecord::Base
  include ActiveModel::Validations
  
  attr_accessor :antispam_value
  
  validates_presence_of :contact_details, :on => :create, :message => "must be entered"
  validates_with AntispamValidator, :on => :create
end