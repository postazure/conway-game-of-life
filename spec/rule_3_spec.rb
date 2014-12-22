require_relative "../lib/cell"

describe "Any live cell with more than three live neighbours dies, as if by overcrowding" do
  describe "self is living" do
    let(:test_cell) {Cell.new(true)}

    it "self has 3 live neighbours" do
      neighbors = [
        Cell.new(true),
        Cell.new(true),
        Cell.new(true),
      ]

      test_cell.new_generation(neighbors)

      expect(test_cell.living).to be true
    end

    it "self has 4 live neighbours" do
      neighbors = [
        Cell.new(true),
        Cell.new(true),
        Cell.new(true),
        Cell.new(true),
      ]

      test_cell.new_generation(neighbors)

      expect(test_cell.living).to be false
    end


  end

  describe "self is dead" do
    let(:test_cell) {Cell.new(false)}

    it "self has 3 live neighbours" do
      neighbors = [
        Cell.new(true),
        Cell.new(true),
        Cell.new(true),
      ]

      test_cell.new_generation(neighbors)

      expect(test_cell.living).to be false
    end

    it "self has 4 live neighbours" do
      neighbors = [
        Cell.new(true),
        Cell.new(true),
        Cell.new(true),
        Cell.new(true),
      ]

      test_cell.new_generation(neighbors)

      expect(test_cell.living).to be false
    end

  end
end
