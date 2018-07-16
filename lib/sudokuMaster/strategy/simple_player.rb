module Sudokumaster
  module Strategy
    class SimplePlayer
      def play(table)
        grid = table.grid
        grid[0].size.times do |i|
          grid[0][0].size.times do |j|
            if grid[i][j] == '*'
              dead_nums = []
              dead_nums << table.row(i)
              dead_nums << table.col(j)
              dead_nums << table.get_block_by_cell(i,j)
              possible_num = Array(1..9) - dead_nums.flatten
              if possible_num.size == 1
                table.set_cell(i, j, possible_num[0])
              end
            end
          end
        end
        table.grid
      end
    end
  end
end
