require 'minitest/autorun'
require 'rack/test'
require 'rubygems'
require_relative '../../api/health'


class TestHealthEndpoint <  Minitest::Test 
   include Rack::Test::Methods

   def app
     Health
   end

   def test_health_must_return_200_ok
     get '/health'
     assert_equal 200, last_response.status, 'Response status should be ok - 200'
   end
end
