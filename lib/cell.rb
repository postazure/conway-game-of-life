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
    
    if self.living == true
      if living_neighbors.count < 2
        self.death
      elsif living_neighbors.count > 3
        self.death
      end
    elsif self.living == false
      if living_neighbors.count == 3
        self.birth
      end
    end
  end
end
