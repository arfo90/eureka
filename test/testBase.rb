require 'rubygems'
require 'bundler'

Bundler.require(:test)

class TestBase < Minitest::Test
    def teardown
      super
      Mocha::Mockery.instance.teardown
      Mocha::Mockery.reset_instance
    end
end
