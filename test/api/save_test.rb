require_relative '../testBase'

class TestSaveEndpoint < TestBase
   include Rack::Test::Methods

   def app
     Save
   end

   def test_save_must_return_400_bad_request
     post '/save'
     assert_equal 400, last_response.status, 'Response status should be bad request - 400'
   end

   def test_save_must_return_201_ok
     post '/save', { date: '10/20/30' , deviceID: 'ID012345', temp:'56', humidity:'10'}
     assert_equal 201, last_response.status, 'Response status should be ok - 201'
   end
end
