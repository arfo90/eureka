$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))
require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

module Sudokumaster
  autoload :Table, 'sudokuMaster/table.rb'
  autoload :Game, 'sudokuMaster/game.rb'

  module Strategy
    autoload :Factory, 'sudokuMaster/strategy/factory.rb'
    autoload :SimplePlayer, 'sudokuMaster/strategy/simple_player.rb'
  end
end
