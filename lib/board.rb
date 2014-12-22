class Board
  def initialize(size)
    @size = size
  end

  def create_grid(cell)
    grid = Array.new(@size) {Array.new(@size)}
    @grid = grid.map do |row|
      row.map do |slot|
        slot = cell.new(true)
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
    [
      [row - 1, col - 1],[row - 1, col],[row - 1, col + 1],
      [row, col - 1],                   [row, col + 1],
      [row + 1, col - 1],[row + 1, col],[row + 1, col + 1],
    ]
  end

  def neighbors(cell_coords)
    neighbors_coords(cell_coords).map do |neighbor|
      cell(neighbor)
    end
  end
end
