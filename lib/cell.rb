class Cell
  def initialize(living)
    @living = living
  end

  def living
    @living
  end

  def new_generation(neighbors)
    living_neighbors = neighbors.map {|x| x.living == true}

    if self.living
      if living_neighbors.count < 2
        return Cell.new(false)
      elsif living_neighbors.count > 3
        return Cell.new(false)
      end
    else
      if living_neighbors.count == 3
        return Cell.new(true)
      end
    end
  end
end
