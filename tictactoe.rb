# Odin Ruby Project: Tic Tac Toe
# https://www.theodinproject.com/lessons/ruby-tic-tac-toe

# refactor all code, use principles of readability, modularity, brevity

# add:
# end game when 1 player wins
# draw, when all spaces are filled
# play new game
# blank numbers on game board print
# eliminate class variables and class methods for now, no reason to use them yet.

class Game
  @@some_variable = true
  attr_reader :game_board
  attr_accessor :game_over

  def initialize
    puts "Welcome to Tic Tac Toe!\n "
    # @@game_board = (0..8).to_a
    @@game_board = Array.new(9, ' ')
    @game_over = false
    player1 = Player.new('Player 1')
    player2 = Player.new('Player 2')
    Game.draw_board
    game(player1, player2)
  end

  def self.current_board
    @@game_board
  end

  def self.draw_board
    puts "\n"
    (0..8).step(3).each do |i|
      puts "\t#{@@game_board[i]} | #{@@game_board[i+1]} | #{@@game_board[i+2]}"
      puts "\t--+---+--" if i < 5
    end
    puts "\n"
  end

  # main loop
  def game(player1, player2)
    loop do
      player1.take_turn(player1.name)
      break if @game_over == true

      puts "game over: #{@game_over}"

      player2.take_turn(player2.name)
      break if @game_over == true
    end
  end

  def self.valid_move(move, player_symb, player)
    @@game_board[move] = player_symb
    Game.draw_board
    Game.win_check(player_symb, player)
  end

  def self.win_check(player_symb, player)
    win_configs = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7],
                   [2, 5, 8], [0, 4, 8], [2, 4, 6]]

    win = win_configs.any? do |win_subarr|
      win_subarr.all? { |space| @@game_board[space] == player_symb }
    end

    if !@@game_board.include?(' ')
      @game_over = true
      puts "this sets gameover to true"
      puts "No spaces left. It's a draw!"
    end

    if win
      @game_over = true
      puts "this sets gameover to true"
      puts "\t << #{player} wins!!! >>" 
    end
  end
end

class Player
  @@sides = ['X', 'O']
  attr_reader :name, :side

  def initialize(name)
    @name = name
    @side = ""
    choose_side
  end

  def choose_side
    if @@sides.length == 2
      begin
        puts 'Choose X or O:'
        # @side = "X"
        @side = Kernel.gets.chomp.upcase.match(/(O|X)/)[0]
      rescue NoMethodError=>e
        puts 'Invalid input. Choose X or O:'
        retry
      end

      puts "#{@name} is #{@side}"
      @@sides.reject! { |item| item == @side }
    else
      @side = @@sides[0]
      puts "#{@name} is #{@side}"
    end
  end

  def take_turn(name)
    while true
      begin
        puts "#{name}, it's your turn! Choose a spot from 1 to 9: "
        intended_spot = Kernel.gets.chomp.match(/[1-9]/)[0]
      rescue NoMethodError
        puts 'Invalid input. Choose a spot from 1 to 9:'
        retry
      end

      intended_spot = intended_spot.to_i - 1 # adjust to 0 index

      if Game.current_board[intended_spot] != ' '
        Game.draw_board
        puts '<< That spot is taken! Try again! >>'
      else
        valid_spot = intended_spot
        break
      end
    end

    Game.valid_move(valid_spot, @side, @name)
  end
end

Game.new
