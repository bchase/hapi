require File.expand_path('../../lib/hapi.rb', __FILE__)

require 'rubygems'
require 'rspec'

Dir["spec/support/**/*.rb"].each { |f| require File.expand_path(f) }

RSpec.configure do |config|
end
