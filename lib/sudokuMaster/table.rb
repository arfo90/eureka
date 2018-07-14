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

private

    def validate(numbers)
      raise ArgumentError, 'Input value, has wrong number of row' unless numbers.size == 9
      raise ArgumentError, 'Input value, has wrong number of col' unless numbers[0].size == 9
    end
  end
end
