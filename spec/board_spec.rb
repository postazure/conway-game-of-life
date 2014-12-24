require_relative "../lib/board"
require_relative "../lib/cell"

describe Board do
  describe "setup" do
    let(:test_board) {Board.new(10)}

    it "has 10x10 grid" do
      test_board.genesis_grid(Cell)
      grid = test_board.grid

      expect(grid.flatten.count).to eq(100)
    end

    it "slots should contain cell objects" do
      test_board.genesis_grid(Cell)
      grid = test_board.grid
      grid_type = grid.flatten.map {|x| x.class == "Cell"}

      expect(grid_type.count).to eq(100)
    end
  end

  describe "individual cell" do
    let(:test_board) {Board.new(10)}

    it "returns an individual cell" do
      test_board.genesis_grid(Cell)
      cell = test_board.cell([0,0])
      expect(cell.class).to eq Cell
    end

    it "can seed a cell" do
      test_board.genesis_grid(Cell)
      test_board.seed_grid([0,0])
      cell = test_board.cell([0,0])

      expect(cell.living).to be true
    end
  end

  describe "neighbors" do
    it "can return the coordinates of neighbor cells of particular cell" do
      test_board = Board.new(10)
      test_board.genesis_grid(Cell)
      neighboring_cells = test_board.neighbors_coords([1,1])
      expect(neighboring_cells).to eq(
      [
        [0,0],[0,1],[0,2],
        [1,0],      [1,2],
        [2,0],[2,1],[2,2],
      ])
    end

    it "is in the corner (with negatives)" do
      test_board = Board.new(10)
      test_board.genesis_grid(Cell)
      neighboring_cells = test_board.neighbors_coords([0,0])
      expect(neighboring_cells).to eq(
      [
              [0,1],
        [1,0],[1,1],
      ])

    end

    it "is in the corner (with negatives)" do
      test_board = Board.new(3)
      test_board.genesis_grid(Cell)
      neighboring_cells = test_board.neighbors_coords([2,2])
      expect(neighboring_cells).to eq(
      [
        [1,1],[1,2],
        [2,1],
        ])

    end
  end
end
