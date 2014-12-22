require_relative "../lib/cell"

describe Cell do
  describe "new cell" do
    it "it is alive" do
      test_cell = Cell.new(true)
      expect(test_cell.living).to be true
    end

    it "is not alive" do
      test_cell = Cell.new(false)
      expect(test_cell.living).to be false
    end
  end

  it "make a cell dead" do
    test_cell = Cell.new(true)
    test_cell.death
    expect(test_cell.living).to be false
  end

  it "make a cell alive" do
    test_cell = Cell.new(false)
    test_cell.birth
    expect(test_cell.living).to be true
  end



  

  # describe "Any dead cell with exactly three live neighbours becomes a live cell"


end
