require_relative "../lib/cell"

describe "Any live cell with two or three live neighbours lives on to the next generation" do
  describe "self is living" do
    let(:test_cell) {Cell.new(true)}

    it "has 2 living neighbor" do
      neighbors = [
        Cell.new(true),
        Cell.new(true),
      ]

      test_cell.new_generation(neighbors)

      expect(test_cell.living).to be true
    end

    it "has 3 living neighbor" do
      neighbors = [
        Cell.new(true),
        Cell.new(true),
        Cell.new(true),
      ]

      test_cell.new_generation(neighbors)

      expect(test_cell.living).to be true
    end
  end

  describe "self is dead" do
    let(:test_cell) {Cell.new(false)}

    it "has 2 living neighbor" do
      neighbors = [
        Cell.new(true),
        Cell.new(true),
      ]

      test_cell.new_generation(neighbors)

      expect(test_cell.living).to be false
    end

    it "has 3 living neighbor" do
      neighbors = [
        Cell.new(true),
        Cell.new(true),
        Cell.new(true),
      ]

      test_cell.new_generation(neighbors)

      expect(test_cell.living).to be false
    end
  end
end
