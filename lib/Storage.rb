$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))

require 'rubygems'
require 'bundler/setup'
require 'grape'

Bundler.require(:default)

module Storage
   module API
     autoload :Health, 'api/health'
     autoload :Save, 'api/save'

     class Mount < Grape::API
       mount Storage::API::Health
     end
   end
end
