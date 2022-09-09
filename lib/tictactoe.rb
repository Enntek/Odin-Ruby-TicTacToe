# frozen_string_literal: true

require 'pry-byebug'

class TicTacToe
  attr_reader :game_board, :player1, :player2
  attr_accessor :game_over

  def initialize
    greeting
    create_board
    @game_over = false
    @sides = ["X", "O"]
    @player1 = Player.new('Player 1', @sides)
    @player2 = Player.new('Player 2', @sides)
    draw_board
    # game(player1, player2)
  end

  def create_board
    @game_board = Array.new(9, ' ')
  end

  def greeting
    puts "\n".bg_black
    puts "\n"
    puts "\t🠞  Welcome to Tic Tac Toe!! 🠜 ".bg_cyan
    puts "\n"
    puts "Tic Tac Toe is a 2 player game. Players take turns placing their mark
    on a 3 by 3 grid.".blue
    puts "\n"
    puts "The player who succeeds in placing three of their marks in a horizontal, \n vertical, or diagonal row is the winner. ".red
    puts "\n"
  end

  def draw_board
    puts "\n"
    (0..8).step(3).each do |i|
      puts "\t#{@game_board[i]} | #{@game_board[i+1]} | #{@game_board[i+2]}"
      puts "\t--+---+--" if i < 5
    end
    puts "\n"
  end

  # main loop
  def play_game
    players = [@player1, @player2]

    loop do
      players.each do |player|
        begin
          player.take_turn(player.name)
          if spot_open?(player.move) == false
            raise 'Error: Chosen spot is taken.'
          end
        rescue StandardError
          puts 'That spot is not free. Try again!'.bg_red
        end

        valid_move(player.move, player.side)
        win_check(player.side, player.name)

        break if @game_over == true
      end
      break if @game_over == true
    end

    play_again(@player1, @player2)
  end

  def play_again(p1, p2)
    puts "Would you like to play again? ['y'/'n']"
    input = gets.chomp

    if input == 'y'
      @game_over = false
      @game_board = Array.new(9, ' ')
      draw_board
      game(p1, p2)
    else
      puts 'Alright, see you soon!'
    end
  end

  def spot_open?(move)
    @game_board[move] == ' '
  end

  def valid_move(move, side)
    @game_board[move] = side
    draw_board
  end

  def win_check(side, name)
    win_configs = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7],
                   [2, 5, 8], [0, 4, 8], [2, 4, 6]]

    win = win_configs.any? do |win_subarr|
      win_subarr.all? { |space| @game_board[space] == side }
    end

    if !@game_board.include?(' ')
      @game_over = true
      puts "\n"
      puts "No spaces left. It's a draw!".bg_red
      puts "\n"
    end

    if win
      @game_over = true
      # puts "this sets gameover to true"
      puts "\n"
      puts "<< #{name} wins!!! >>".bg_magenta
      puts "\n"
    end
  end
end

class String
  def black;          "\e[30m#{self}\e[0m" end
  def red;            "\e[31m#{self}\e[0m" end
  def green;          "\e[32m#{self}\e[0m" end
  def brown;          "\e[33m#{self}\e[0m" end
  def blue;           "\e[34m#{self}\e[0m" end
  def magenta;        "\e[35m#{self}\e[0m" end
  def cyan;           "\e[36m#{self}\e[0m" end
  def gray;           "\e[37m#{self}\e[0m" end
  def default;        "\e[39m#{self}\e[0m" end

  def bg_black;       "\e[40m#{self}\e[0m" end
  def bg_red;         "\e[41m#{self}\e[0m" end
  def bg_green;       "\e[42m#{self}\e[0m" end
  def bg_brown;       "\e[43m#{self}\e[0m" end
  def bg_blue;        "\e[44m#{self}\e[0m" end
  def bg_magenta;     "\e[45m#{self}\e[0m" end
  def bg_cyan;        "\e[46m#{self}\e[0m" end
  def bg_gray;        "\e[47m#{self}\e[0m" end

  def bold;           "\e[1m#{self}\e[22m" end
  def italic;         "\e[3m#{self}\e[23m" end
  def underline;      "\e[4m#{self}\e[24m" end
  def blink;          "\e[5m#{self}\e[25m" end
  def reverse_color;  "\e[7m#{self}\e[27m" end
end