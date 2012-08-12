class Admin::AdminController < ApplicationController
  http_basic_authenticate_with :name => SITE_CONFIG['username'], :password => SITE_CONFIG['password'] if SITE_CONFIG['perform_authentication']
  layout 'admin'

  # GET /admin
  def admin
    render '/admin/admin'
  end

end
