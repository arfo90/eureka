require_relative './base_test'

class TestTable < TestBase
  def setup
    @nums_empty = Array.new(9){Array.new(9)}
    @nums = [[5,3,'*','*',7,'*','*','*','*'],
             [6,'*','*',1,9,5,'*','*','*'],
             ['*',9,8,'*','*','*','*',6,'*'],
             [8,'*','*','*',6,'*','*','*',3],
             [4,'*','*',8,'*',3,'*','*',1],
             [7,'*','*','*',2,'*','*','*',6],
             ['*',6,'*','*','*','*',2,8,'*'],
             ['*','*','*',4,1,9,'*','*',5],
             ['*','*','*','*',8,'*','*',7,9]]
  end

  def test_class_exists
    assert_nothing_raised "Class doesn't exists" do
      Sudokumaster::Table.new(@nums_empty)
    end
  end

  def test_table_initilize_9X9_grid
    grid = Sudokumaster::Table.new(@nums_empty).grid
    assert_equal(9, grid.size, "Grid doesn't have expected row")
    assert_equal(9, grid[0].size, "Grid doesn't have expected col")
  end

  def test_navigate_row_return_particular_row_from_grid
    table = Sudokumaster::Table.new(@nums)

    first_row = [5,3,'*','*',7,'*','*','*','*']
    last_row = ['*','*','*','*',8,'*','*',7,9]
    assert_equal(first_row, table.row(0), "Wrong row been returned!")
    assert_equal(last_row, table.row(8), "Wrong row been returned!")
  end

  def test_navigate_col_return_particular_col_from_grid
    table = Sudokumaster::Table.new(@nums)

    first_col = [5,6,'*',8,4,7,'*','*','*']
    last_col  = ['*','*','*',3,1,6,'*',5,9]

    assert_equal(first_col, table.col(0), "Wrong col been returned!")
    assert_equal(last_col, table.col(8), "Wrong col been returned!")
  end
end
