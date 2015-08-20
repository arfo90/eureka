require 'rubygems'
require 'bundler/setup'

Bundler.require(:default)

module Storage
   module api
       autoload :Target, 'drivers/target'
   end
end
