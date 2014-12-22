class Board
  def initialize(size)
    @size = size
  end

  def create_grid(cell)
    grid = Array.new(@size) {Array.new(@size)}
    @grid = grid.map do |row|
      row.map do |slot|
        slot = cell.new(true) #need to pass in 'new' instead of having this here
      end
    end
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
end
