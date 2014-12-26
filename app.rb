require "./lib/board"
require "./lib/cell"
require "./lib/game"

board = Board.new(50)
board.genesis_grid(Cell)
Game.generate_seeds(3, board)

num_of_generations = 1000
num_of_generations.times do |i|
  # puts "#{i} Generations \n#{"%"*board.grid.size}"
  board.next_gen_board
  Game.print_generation(board)
end
