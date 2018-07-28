$LOAD_PATH << File.expand_path(File.dirname(__FILE__))

require 'rubygems'
require 'bundler/setup'

Bundler.require(:default)

module Storage
   module API
     autoload :Health, 'api/health'
     autoload :Save, 'api/save'

     class Mount < Grape::API
       mount Storage::API::Health
     end
   end

   module Service
     autoload :DepotService, 'service/depot_service.rb'
   end
end
