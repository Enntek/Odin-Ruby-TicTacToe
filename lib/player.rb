# frozen_string_literal: true

require_relative 'tictactoe'

# There are 2 players in Tic Tac Toe
class Player
  attr_reader :player_name, :side, :move

  def initialize(player_name, side = '')
    @player_name = player_name
    @side = side
  end

  def establish_side(choice)
    @side = choice
  end



end
