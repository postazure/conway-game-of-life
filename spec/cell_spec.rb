require_relative "../lib/cell"

describe Cell do
  it "#alive" do
    test_cell = Cell.new(true)

    expect(test_cell.alive).to be true
  end
end
