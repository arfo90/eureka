require_relative '../base_test'

class FactoryTest < TestBase
  def test_factory_returns_simple_palyer
    player = Sudokumaster::Strategy::Factory.build(:simple)
    assert_instance_of(Sudokumaster::Strategy::SimplePlayer, player, "Wrong instance is built!")
  end
end
