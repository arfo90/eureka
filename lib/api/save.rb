module Storage
  module API
    class Save < Grape::API

      version 'v1', using: :header, vendor: 'iotcc'

      resource :save do
        #decs "saving data into the database"

        params do
          requires :date, type: String, desc: "Triggered date"
          requires :deviceID, type: String, desc: "Device unique id"
          requires :temp, type: String, desc: "tempature number"
          requires :humidity, type: String, desc: "Humidity level"
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
  end
end
