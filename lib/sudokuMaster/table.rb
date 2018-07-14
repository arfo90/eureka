module Sudokumaster
  class Table
    attr_reader :grid

    def initialize(numbers)
      validate(numbers)

      @grid = numbers
    end

    def row(row_number)
      @grid[row_number]
    end

    def col(col_number)
      @grid.map {|row| row[col_number]}
    end

    def get_block_by_cell(row, col)
      block = []
      if row < 3
        row_section = [0,1,2]
      elsif row >= 3 && row < 6
        row_section = [3,4,5]
      else
        row_section = [6,7,8]
      end

      if col < 3
        col_section = [0,1,2]
      elsif col >= 3 && col < 6
        col_section = [3,4,5]
      else
        col_section = [6,7,8]
      end

      row_section.each do |r|
        col_section.each do |c|
          block << grid[r][c]
        end
      end
      block
    end

private

    def validate(numbers)
      raise ArgumentError, 'Input value, has wrong number of row' unless numbers.size == 9
      raise ArgumentError, 'Input value, has wrong number of col' unless numbers[0].size == 9
    end
  end
end
