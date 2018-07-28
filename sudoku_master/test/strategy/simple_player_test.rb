require_relative '../base_test'

class SimplePlayerTest < TestBase 
  def setup
    nums = [[5,3,'*','*',7,8,9,1,2], [6,'*','*',1,9,5,'*','*','*'], ['*',9,8,'*','*','*','*',6,'*'], [8,'*','*','*',6,'*','*','*',3], [4,'*','*',8,'*',3,'*','*',1], [7,'*','*','*',2,'*','*','*',6], ['*',6,'*','*','*','*',2,8,'*'], ['*','*','*',4,1,9,'*','*',5], ['*','*','*','*',8,'*','*',7,9]]
    @grid = Sudokumaster::Table.new(nums)
  end

  def test_play_method_accept_grid_and_returns_possible_answers_as_grid
    player = Sudokumaster::Strategy::SimplePlayer.new
    solved_grid = player.play(@grid)
    assert_equal(6, solved_grid[0].grid[0][3], "Player picked Wrong number!")
    assert_equal(36, solved_grid[1], "wrong unsolved values")
  end
end
