require "pp"

grid = Array.new(2){Array.new(3)}

grid[0].size.times do |i|
end

grid2 = [[],
         [2,5,6],
         [8,9,0],
         [7,nil,2]]




def col(col, grid2)
  numbers = []
  grid2.each do |n|
    numbers << n[col]
  end
  numbers
end


grid3 = []

9.times do |j|
row = []
9.times do |i|
  row << [1,2,3,4,5,6,7,8,9,'*','*','*','*'].sample
end
grid3 << row
end

pp grid3

p "\n"
p "------"

p col(2, grid3)

def render(grid)
  puts '-------------------------------------'
  grid.each do |r|
    row = "| "
    r.size.times do |i|
      row << "#{r[i]} | "
    end
    puts row
    puts '-------------------------------------'
  end
end

render(grid3)


def block(grid, row, col)
  row_section = [] 
  col_section = []
  block = []
  row_section = grid.size - row
  if row_section >= 6
    row_section = [0,1,2]
  elsif row_section < 6 && row_section > 2
    row_section = [3,4,5]
  else
    row_section = [6,7,8]
  end

  col_section = grid.size - col
  if col_section >= 6
    col_section = [0,1,2]
  elsif col_section < 6 && col_section > 2
    col_section = [3,4,5]
  else
    col_section = [6,7,8]
  end

  p col_section
  p row_section

  row_section.each do |r|
    col_section.each do |c|
      block << grid[r][c]
    end
  end
  block
end

puts "Insert row"
slot_row = gets.chomp

puts "Insert col"
slot_col = gets.chomp

p block(grid3, slot_row.to_i, slot_col.to_i)
