require_relative './base_test'

class TestTable < TestBase
  def setup
    @nums = Array.new(9){Array.new(9)}
  end

  def test_class_exists
    assert_nothing_raised "Class doesn't exists" do
      Sudokumaster::Table.new(@nums)
    end
  end

  def test_table_initilize_9X9_grid
    grid = Sudokumaster::Table.new(@nums).grid
    assert_equal(9, grid.size, "Grid doesn't have expected row")
    assert_equal(9, grid[0].size, "Grid doesn't have expected col")
  end
end
