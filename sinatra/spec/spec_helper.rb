require "rspec"
require "rack/test"
require "./i_ching_server"

ENV["RACK_ENV"] = "test"

RSpec.configure do |config|
  config.include Rack::Test::Methods
end
