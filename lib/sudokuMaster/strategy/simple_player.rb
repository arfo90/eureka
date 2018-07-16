module Sudokumaster
  module Strategy
    class SimplePlayer
      def play(table)
        grid = table.grid
        unsolved_slots = 0
        grid[0].size.times do |i|
          grid[0][0].size.times do |j|
            if grid[i][j] == '*' || grid[i][j] == 0
              dead_nums = [] << table.row(i) << table.col(j) << dead_nums << table.get_block_by_cell(i,j)
              possible_num = Array(1..9) - dead_nums.flatten
              if possible_num.size == 1
                table.set_cell(i, j, possible_num[0])
              else
                unsolved_slots +=1
              end
            end
          end
        end
        return table, unsolved_slots
      end
    end
  end
end
