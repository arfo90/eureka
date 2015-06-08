require 'grape'

class Health < Grape::API
  
  version 'v1', using: :header, vendor: 'iotcc' 
 
  resource :health do
   #desc "Checking API health"
   get do
     "testing health........."
     "Service is running"
   end
  end
 
  resource :save do
   #decs "saving data into the database"
   
   params do 
     requires :date, type: String, desc: "Triggered date"
   end

   post do 
       
    begin 
      result = "it is accepted"
      valDate = params[:date]
      File.open('date.txt', 'w') { |file| file.write(valDate.to_s) }
    rescue ArgumentError => e 
    end
 
   end
  end
end
