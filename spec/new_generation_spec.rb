require_relative "../lib/board"
require_relative "../lib/cell"

describe "new generation" do
  it "cell should die from under-pop" do
    test_board = Board.new(1)
    test_board.genesis_grid(Cell)
    test_board.seed_grid([0,0])
    cell1 = test_board.cell([0,0])
    expect(cell1.living).to be true

    test_board.next_gen_board
    cell2 = test_board.cell([0,0])
    expect(cell1.living).to be true
    expect(cell2.living).to be false
  end

  describe "Any live cell with fewer than two live neighbours dies, as if caused by under-population" do
    it "has 1 living neighbor" do
      test_board = Board.new(2)
      test_board.genesis_grid(Cell)
      test_board.seed_grid([0,0])
      test_board.seed_grid([1,1])
      test_board.next_gen_board
      test_cell = test_board.cell([1,1])

      expect(test_cell.living).to be false
    end
  end

  describe "Any live cell with two or three live neighbours lives on to the next generation" do
    it "has 2 living neighbor" do
      test_board = Board.new(2)
      test_board.genesis_grid(Cell)
      test_board.seed_grid([0,0])
      test_board.seed_grid([1,0])
      test_board.seed_grid([0,1])

      test_board.next_gen_board
      test_cell = test_board.cell([0,1])

      expect(test_cell.living).to be true
    end

    it "has 3 living neighbor" do
      test_board = Board.new(2)
      test_board.genesis_grid(Cell)
      test_board.seed_grid([0,0])
      test_board.seed_grid([1,0])
      test_board.seed_grid([0,1])
      test_board.seed_grid([1,1])

      test_board.next_gen_board
      test_cell = test_board.cell([0,1])

      expect(test_cell.living).to be true
    end
  end

  describe "Any live cell with more than three live neighbours dies, as if by overcrowding" do
    it "has 4 living neighbor" do
      test_board = Board.new(3)
      test_board.genesis_grid(Cell)
      test_board.seed_grid([0,0])
      test_board.seed_grid([1,0])
      test_board.seed_grid([2,0])
      test_board.seed_grid([0,1])
      test_board.seed_grid([1,1])

      test_board.next_gen_board
      test_cell = test_board.cell([1,1])

      expect(test_cell.living).to be false
    end
  end

  describe "Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction" do
    it "has 3 living neighbor" do
      test_board = Board.new(3)
      test_board.genesis_grid(Cell)

      test_board.seed_grid([0,0])
      test_board.seed_grid([0,1])
      test_board.seed_grid([0,2])
      test_board.next_gen_board

      test_cell = test_board.cell([1,1])

      expect(test_cell.living).to be true
    end

  end
end
