require_relative "../lib/board"
require_relative "../lib/cell"

describe Board do
  describe "setup" do
    let(:test_board) {Board.new(10)}

    it "has 10x10 grid" do
      test_board.create_grid(Cell)
      grid = test_board.grid

      expect(grid.flatten.count).to eq(100)
    end

    it "slots should contain cell objects" do
      test_board.create_grid(Cell)
      grid = test_board.grid
      grid_type = grid.flatten.map {|x| x.class == "Cell"}

      expect(grid_type.count).to eq(100)
    end
  end

  describe "individual cell" do
    let(:test_board) {Board.new(10)}

    it "returns an individual cell" do
      test_board.create_grid(Cell)
      cell = test_board.cell([0,0])
      expect(cell.class).to eq Cell
    end

    it "can change individual cell's status" do
      test_board.create_grid(Cell)
      cell1 = test_board.cell([0,0])
      cell2 = test_board.cell([0,1])
      expect(cell1.living).to be true
      expect(cell2.living).to be true

      cell1.death
      expect(cell1.living).to be false
      expect(cell2.living).to be true
    end
  end

  describe "neighbors" do
    it "can return the coordinates of neighbor cells of particular cell" do
      test_board = Board.new(10)
      test_board.create_grid(Cell)
      neighboring_cells = test_board.neighbors_coords([1,1])
      expect(neighboring_cells).to eq(
      [
        [0,0],[0,1],[0,2],
        [1,0],      [1,2],
        [2,0],[2,1],[2,2],
      ])
    end

    it "can return the neighbor cells of particular cell" do
      test_board = Board.new(3)
      test_board.create_grid(Cell)
      test_board.cell([0,0]).death
      test_board.cell([0,1]).death

      neighboring_cells = test_board.neighbors([1,1])
      
      expect(neighboring_cells.first.living).to be false
      expect(neighboring_cells[1].living).to be false
      expect(neighboring_cells[2].living).to be true
      expect(neighboring_cells.last.living).to be true
      end
  end
end
