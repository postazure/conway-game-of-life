class Cell
  def initialize(living)
    @living = living
  end

  def birth
    @living = true
  end

  def death
    @living = false
  end

  def living
    @living
  end

  def new_generation(neighbors)
    living_neighbors = neighbors.select {|x| x.living == true}
    # dead_neighbors = neighbors.select {|x| x.living == false}
    if self.living
      if living_neighbors.count < 2
        self.death
      end

      
    else

    end
  end
end
