# frozen_string_literal: true

require_relative 'player'
require_relative 'gameboard'
require_relative 'display'


class TicTacToe
  include Display

  attr_reader :game_board, :player1, :player2
  attr_accessor :game_over, :current_turn

  def initialize
    @game_board = GameBoard.new
    @player1 = Player.new('Player 1')
    @player2 = Player.new('Player 2')

  end

  def draw_board
    puts "\n"
    (0..8).step(3).each do |i|
      puts "\t#{@game_board.cells[i]} | #{@game_board.cells[i + 1]} | #{@game_board.cells[i + 2]}"
      puts "\t--+---+--" if i < 5
    end
    puts "\n"
  end

  def play_game
    greeting
    establish_sides
    self.current_turn = player1
    take_turns until game_over?
    play_again
  end

  def choose_side
    choose_side_msg
    loop do
      user_input = gets.chomp.upcase
      valid_input = verify_input(user_input) if user_input.match?(/(O|X)/)
      return valid_input if valid_input

      choose_side_error_msg
    end
  end

  def verify_input(input)
    return input if input.upcase.match(/(O|X)/)
  end

  def establish_sides
    p1_choice = choose_side
    remaining_side = p1_choice == 'X' ? 'O' : 'X'
    @player1.establish_side(p1_choice)
    @player2.establish_side(remaining_side)
  end

  def take_turns
    draw_board
    valid_cell = pick_valid_cell
    take_available_cell(valid_cell)
    check_game
    switch_players
  end

  def take_available_cell(number)
    @game_board.cells[number].state = current_turn.side
  end

  def cell_available?(number)
    true if @game_board.cells[number].state == ' '
  end

  def pick_valid_cell
    loop do
      valid_number = input_number.to_i - 1 # 0 index
      return valid_number if cell_available?(valid_number)

      invalid_turn_input_msg
    end
  end

  def input_number
    loop do
      turn_msg
      intended_spot = gets.chomp
      return intended_spot if intended_spot.match(/^\d{1}$/)
      
      # match(/^[a-zA-Z]{2}+$/) # nil; very strict with carat + $, limit to {2} characters

      invalid_turn_input_msg
    end
  end

  def switch_players
    self.current_turn = current_turn == player1 ? player2 : player1
  end

  def check_game
    check_win(current_turn.side, current_turn.player_name)
    check_draw
  end

  def play_again
    puts "Would you like to play again? ['y'/'n']"
    input = gets.chomp

    if input == 'y'
      @game_over = false
      @game_board = GameBoard.new
      play_game
    else
      puts 'Alright, see you soon!'
    end
  end

  def game_over?
    true if game_over
  end

  def check_draw
    return if @game_over

    all_spaces = list_of_cell_states

    if all_spaces.none? { |x| x == ' ' }
      @game_over = true
      draw_board
      draw_msg
    end
  end

  def list_of_cell_states
    @game_board.map.with_index do |item, index|
      @game_board.cells[index].state
    end
  end

  def check_win(side, name)
    win_configs = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7],
                   [2, 5, 8], [0, 4, 8], [2, 4, 6]]

    win = win_configs.any? do |win_subarr|
      win_subarr.all? { |space| @game_board.cells[space].state == side }
    end

    win_game if win
  end

  def win_game
    draw_board
    @game_over = true
    win_msg
  end
end
