class Board
  def initialize(size)
    @size = size
  end

  def genesis_grid(cell)
    grid = Array.new(@size) {Array.new(@size)}
    @grid = grid.map do |row|
      row.map do |slot|
        slot = cell.new(false) #need to pass in 'new' instead of having this here
      end
    end
  end

  def seed_grid(coords)
    x,y=coords
    @grid[x][y] = Cell.new(true)
  end

  def grid
    @grid
  end

  def cell(coords)
    x, y = coords
    @grid[x][y]
  end

  def neighbors_coords(cell_coords)
    row, col = cell_coords

    neighbors_arrays = [
      [row - 1, col - 1],[row - 1, col],[row - 1, col + 1],
      [row, col - 1],                   [row, col + 1],
      [row + 1, col - 1],[row + 1, col],[row + 1, col + 1],
    ]

    prevent_board_wrap(neighbors_arrays)
  end

  def prevent_board_wrap(neighbors_arrays)
    return_array = []
    neighbors_arrays.each do |cell|
      cell.each_cons(2) do |i,j|
        if (i >= 0 && j >= 0) && (i<=(@size-1) && j<=(@size-1))
          return_array.push([i,j])
        end
      end
    end

    return_array
  end

  def neighbors(cell_coords)
    neighbors_coords(cell_coords).map do |neighbor|
      cell(neighbor)
    end
  end

  def next_gen_board
    grid = @grid.clone

    new_grid = grid.each_with_index.map do |row, x|
      row.each_with_index.map do |slot, y|
        coords = [x,y]
        neighbors = self.neighbors(coords)
        cell = self.cell(coords)
        slot = cell.new_generation(neighbors)
      end
    end
    @grid = new_grid
  end
end
