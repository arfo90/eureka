require 'pry'
require_relative 'lib/sudokuMaster'

puts "To start the game, insert the array of initial puzzle\n"
puts "=> each row gets 9 number and puzzle has 9 coloumns(divide dby |), \n=> insert '*' for unknown numbers \n=> following is sample input format and also defualt game to play\n\n"
puts "5,3,'*','*',7,'*','*','*','*' | 6,'*','*',1,9,5,'*','*','*' | '*',9,8,'*','*','*','*',6,'*' | 8,'*','*','*',6,'*','*','*',3 |  4,'*','*',8,'*',3,'*','*',1 | 7,'*','*','*',2,'*','*','*',6 |'*',6,'*','*','*','*',2,8,'*' |  '*','*','*',4,1,9,'*','*',5 | '*','*','*','*',8,'*','*',7,9"
puts "\n insert the puzzle =>"
puzzle = gets.chomp

col = puzzle.split('|')
puzzle = []

col.each do |r|
   puzzle << r.split(',').map(&:to_i)
end


table = Sudokumaster::Table.new(puzzle)
player = Sudokumaster::Strategy::Factory.build(:simple)
circle_brekaer_limit = 0
unsolved_slots = 0


while circle_brekaer_limit < 10
  round = player.play(table)
  if round[1] == unsolved_slots
    circle_brekaer_limit +=1
  end
  unsolved_slots = round[1]
  table = round[0]
end

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



render(table.grid)

