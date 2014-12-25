class Cell
  def initialize(living)
    @living = living
  end

  def living
    @living
  end

  def new_generation(neighbors)
    living_neighbors = neighbors.select {|x| x.living == true}
    # puts "#"*20
    # p living_neighbors
    # puts living_neighbors.count
    if self.living
      if living_neighbors.count < 2
        return Cell.new(false)
      elsif living_neighbors.count > 3
        return Cell.new(false)
      else
        return Cell.new(true)
      end
    else
      # puts "#"*20
      # puts "Cell is Dead"
      if living_neighbors.count == 3
      #   puts "Cell has 3 living neighbors"
        return Cell.new(true)
      else
        return Cell.new(false)
      end
    end
    # if self.living
    #   if living_neighbors.count < 2
    #     return Cell.new(false)
    #   elsif living_neighbors.count > 3
    #     return Cell.new(false)
    #   else
    #     return Cell.new(true)
    #   end
    # else
    #   if living_neighbors.count == 3
    #     return Cell.new(true)
    #   else
    #     return Cell.new(false)
    #   end
    # end
  end
end
