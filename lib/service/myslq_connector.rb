require 'mysql2'

password = ENV['DB_PASSWORD']
client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => password, :database => "tempoDepo")
result =  client.query('SELECT * FROM things')

result.each do |row|
 
 puts row["id"]
 puts row["name"]

end

