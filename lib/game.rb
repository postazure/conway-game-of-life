class Game
  def self.print_generation(board)
    board.grid.each do |row|
      row.each {|slot| print "#{slot.living == true ? "*" : " "}"}
      puts
    end
  end

  def self.generate_seeds(qty, board)
    counter = board.grid.size
    counter.times do |x|
      counter.times do |y|
        board.seed_grid([x,y]) if rand(1..10) < qty
      end
    end
  end
end
