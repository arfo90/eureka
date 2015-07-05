require 'rack/test'
require 'minitest/autorun'
require 'rubygems'
require_relative '../lib/save_temp'


class TestSaveEndpoint < Minitest::Test 
   include Rack::Test::Methods


   def test_save_temp_class_object
     begin
       Save_temp.new
     rescue 
     end
   end
end
