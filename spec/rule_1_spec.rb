require_relative "../lib/cell"

describe "Any live cell with fewer than two live neighbours dies, as if caused by under-population" do
  describe "self is living" do
    let(:test_cell) {Cell.new(true)}

    it "has 1 living neighbor" do
      test_cell = Cell.new(true)
      neighbors = [
        Cell.new(true),
      ]

      test_cell.new_generation(neighbors)

      expect(test_cell.living).to be false
    end

    it "has 1 dead neighbor" do
      test_cell = Cell.new(true)
      neighbors = [
        Cell.new(false),
      ]

      test_cell.new_generation(neighbors)

      expect(test_cell.living).to be false
    end

    it "has 2 living neighbor" do
      test_cell = Cell.new(true)
      neighbors = [
        Cell.new(true),
        Cell.new(true),
      ]

      test_cell.new_generation(neighbors)

      expect(test_cell.living).to be true
    end
  end

  describe "self is dead" do
    let(:test_cell) {Cell.new(false)}

    it "has 1 living neighbor" do
      neighbors = [
        Cell.new(true),
      ]

      test_cell.new_generation(neighbors)

      expect(test_cell.living).to be false
    end

    it "has 1 dead neighbor" do
      neighbors = [
        Cell.new(false),
      ]

      test_cell.new_generation(neighbors)

      expect(test_cell.living).to be false
    end

    it "has 2 living neighbor" do
      neighbors = [
        Cell.new(true),
        Cell.new(true),
      ]

      test_cell.new_generation(neighbors)

      expect(test_cell.living).to be false
    end
  end
end
