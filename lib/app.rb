require_relative "../lib/board"
require_relative "../lib/cell"


def print_generation(board)
  grid = board.grid

  grid.each do |row|
    row.each do |slot|
      print "#{slot.living == true ? "*" : " "}"
    end
    print "\n"
  end
end

def generate_seeds(qty, board)
  counter = board.grid.size

  counter.times do |x|
    counter.times do |y|
      if rand(1..10) > qty
        board.seed_grid([x,y])
      end
    end
  end
end

times_to_run = 1000

board = Board.new(44)
board.genesis_grid(Cell)
generate_seeds(6, board)
print_generation(board)
times_to_run.times do |i|
  puts "#{i} Generations \n#{"%"*board.grid.size}"
  board.next_gen_board
  print_generation(board)
end
