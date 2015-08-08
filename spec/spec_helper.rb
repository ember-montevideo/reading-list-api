require "minitest/autorun"
require "rack/test"
require "app"

include Rack::Test::Methods

def app
  App.freeze.app
end
