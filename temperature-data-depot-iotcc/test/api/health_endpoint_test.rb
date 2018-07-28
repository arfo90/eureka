require_relative '../testBase'

class TestHealthEndpoint <  TestBase
   include Rack::Test::Methods

   def app
     Storage::API::Health
   end

   def test_health_must_return_200_ok
     get '/health'
     assert_equal 200, last_response.status, 'Response status should be ok - 200'
   end
end
