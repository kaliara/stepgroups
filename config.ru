# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)

# Include Sinatra App
sinatra_path = '../signup/signup.rb'
File.exists?(File.expand_path(sinatra_path))
require sinatra_path

# Make sinatra play nice
use Rack::MethodOverride
disable :run, :reload

# Mapping - Normal urls go to rails
map "/" do
  run Coda::Application
end

# Mapping - urls starting with /apply will go to Sinatra
map "/apply" do
  run SignupApp
end

