require 'grape'

class Health < Grape::API
  
  version 'v1', using: :header, vendor: 'iotcc' 
 
  resource :health do
   desc "Checking API health"
   get do
     "Service is running"
   end
  end
end
