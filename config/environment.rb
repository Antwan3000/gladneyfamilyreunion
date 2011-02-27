# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
GladneyreunionOrg::Application.initialize!

# HAML Options
Haml::Template.options[:format] = :html5