require_relative "../lib/cell"

describe Cell do
  describe "#initialize" do
    it "alive" do
      test_cell = Cell.new(true)

      expect(test_cell.living).to be true
    end

    it "dead" do
      test_cell = Cell.new(false)

      expect(test_cell.living).to be false
    end
  end
end
