require 'mysql2'

class Save_temp
   attr_accessor :data
   password = ENV['DB_PASSWORD'] || 'sudden-mudden'

   def initialize
     @data = {}
     @client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => 'sudden-mudden', :database => "tempoDepo")
   end

   def insert(temp_data)
	@data = temp_data
        @client.query("INSERT INTO temperature (temp,device,loggedDay,loggedTime) VALUES (#{@data[:temp]},#{@data[:device]},#{@date[:date]},#{@date[:time]}") 
   end   
end
