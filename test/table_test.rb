require_relative './base_test'

class TestTable < TestBase
  def test_class_exists
    assert_nothing_raised "Class doesn't exists" do
      Sudokumaster::Table.new
    end
  end
end
