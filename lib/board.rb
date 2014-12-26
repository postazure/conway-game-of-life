class Board
  attr_reader :grid
  def initialize(size)
    @size = size
  end

  def genesis_grid(cell)
    grid = Array.new(@size) {Array.new(@size)}
    @grid = grid.map do |row|
      row.map do |slot|
        slot = cell.new(false)
      end
    end
  end

  def next_gen_board
    @grid = @grid.each_with_index.map do |row, x|
      row.each_with_index.map do |slot, y|
        neighbors = self.neighbors([x,y])
        cell = self.cell([x,y])
        slot = cell.new_generation(neighbors)
      end
    end
  end

  def seed_grid(i)
    grid[i.first][i.last] = Cell.new(true)
  end

  def cell(i)
    grid[i.first][i.last]
  end

  def neighbors(cell_coords)
    neighbors_coords(cell_coords).map do |neighbor|
      cell(neighbor)
    end
  end

  def neighbors_coords(cell_coords)
    row, col = cell_coords

    prevent_board_wrap([
      [row - 1, col - 1],[row - 1, col],[row - 1, col + 1],
      [row, col - 1],                   [row, col + 1],
      [row + 1, col - 1],[row + 1, col],[row + 1, col + 1],
    ])
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
end
