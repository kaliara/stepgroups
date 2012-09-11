# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)

# For Sinatra
require 'signup.rb'

# - Make sinatra play nice
use Rack::MethodOverride
disable :run, :reload

# Mapping

# Rest with Rails
map "/" do
  run Coda::Application
end

# Anything urls starting with /slim will go to Sinatra
map "/apply" do
  run SignupApp
end

