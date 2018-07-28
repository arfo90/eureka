module Storage
  module API
    class Health < Grape::API
      version 'v1', using: :header, vendor: 'iotcc' 

      resource :health do
        #desc "Checking API health"
        get do
          "testing health........."
          "Service is running"
        end
      end
    end
  end
end
