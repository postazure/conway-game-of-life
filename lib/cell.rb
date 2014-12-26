class Cell
  attr_reader :living
  def initialize(living)
    @living = living
  end

  def new_generation(neighbors)
    living_neighbors = (neighbors.select {|x| x.living == true}).count

    if self.living && (living_neighbors < 2 || living_neighbors > 3)
      next_gen_cell = Cell.new(false)
    elsif !self.living && living_neighbors != 3
      next_gen_cell = Cell.new(false)
    end
    next_gen_cell ||= Cell.new(true)
  end
end
