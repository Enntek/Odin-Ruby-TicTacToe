# frozen_string_literal: true

class GameBoard
  attr_reader :cells

  def initialize
    puts 'create board!'
    @cells = create_cells
  end

  Cell = Struct.new(:number, :state)

  def create_cells(all_cells = Array.new(9))
    all_cells.map.with_index do |element, index|
      Cell.new(index, 'unoccupied')
    end
  end
end

# gameboard = GameBoard.new
# p gameboard.cells[0]
