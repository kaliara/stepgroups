class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_organization
  
  def set_organization
    Organization.connect_database(request.host)
  end
end