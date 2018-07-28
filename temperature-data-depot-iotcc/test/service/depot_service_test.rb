require_relative '../testBase'

class TestDepotService <  TestBase
    
  def test_calss_exist
    depot = Storage::Service::DepotService.new
  end

  def test_calss_has_save_method
    assert Storage::Service::DepotService.method_defined? :save
  end
end
