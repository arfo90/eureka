require 'rack/test'
require 'minitest/autorun'
require 'rubygems'
require_relative '../../lib/save_temp'

class TestSaveEndpoint < Minitest::Test 
   include Rack::Test::Methods


   def test_save_temp_class_object
     begin
       Save_temp.new
     rescue 
       raise 'Class is not existing'
     end
   end

   def test_save_temp_class_initialize
      data = {temp: 15, date: 'today'}
   # begin 
   #   insert = Save_temp.new.insert(data)
   #   assert_equal 15, insert[:temp], "Tempater is not match"
   # rescue Exception => e   
   #   raise 'access problem to tempature'  
   #   p e
   # end
   end 
end
