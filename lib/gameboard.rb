# frozen_string_literal: true

require 'forwardable'

# Each GameBoard contains 9 Cells
class GameBoard
  extend Forwardable
  include Enumerable
  def_delegators :@cells, :size, :each

  attr_reader :cells

  def initialize
    @cells = create_cells
  end

  Cell = Struct.new(:number, :state) do
    def to_s
      "#{state}"
    end
  end

  def create_cells(all_cells = Array.new(9))
    all_cells.map.with_index do |element, index|
      Cell.new(index, ' ')
    end
  end
end
