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
end
