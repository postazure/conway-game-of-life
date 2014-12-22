require_relative "../lib/cell"

describe Cell do
  describe "Any live cell with fewer than two live neighbours dies. " do
    let(:test_cell) {Cell.new(true)}

    it "Has 1 living neighbor." do
      neighbors = [
        Cell.new(true),
      ]

      test_cell.new_generation(neighbors)

      expect(test_cell.living).to be false
    end
  end

  describe "Any live cell with two or three live neighbours lives on to the next generation. " do
    let(:test_cell) {Cell.new(true)}

    it "Has 2 living neighbor. " do
      neighbors = [
        Cell.new(true),
        Cell.new(true),
      ]

      test_cell.new_generation(neighbors)

      expect(test_cell.living).to be true
    end

    it "Has 3 living neighbor. " do
      neighbors = [
        Cell.new(true),
        Cell.new(true),
        Cell.new(true),
      ]

      test_cell.new_generation(neighbors)

      expect(test_cell.living).to be true
    end
  end

  describe "Any live cell with more than three live neighbours dies, as if by overcrowding. " do
    let(:test_cell) {Cell.new(true)}

    it "Has 4 live neighbours. " do
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

  describe "Any dead cell with exactly three live neighbours becomes a live cell" do
    let(:test_cell) {Cell.new(false)}

    it "self has 3 live neighbours" do
      neighbors = [
        Cell.new(true),
        Cell.new(true),
        Cell.new(true),
      ]

      test_cell.new_generation(neighbors)

      expect(test_cell.living).to be true
    end
  end
end
