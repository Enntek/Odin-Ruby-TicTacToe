# Odin Ruby Project: Tic Tac Toe
# https://www.theodinproject.com/lessons/ruby-tic-tac-toe

# refactor all code, use principles of readability, modularity, brevity

# add:
# draw, when all spaces are filled
# play new game
# break outer and inner loop at once

# learned today: use instance variables and pass them back and forth freely

class Game
  attr_reader :game_board
  attr_accessor :game_over

  def initialize
    puts "Welcome to Tic Tac Toe!\n "
    @game_board = Array.new(9, ' ')
    @game_over = false
    @sides = ["X", "O"]
    player1 = Player.new('Player 1', @sides)
    player2 = Player.new('Player 2', @sides)
    draw_board
    game(player1, player2)
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
  def game(player1, player2)
    players = [player1, player2]

    loop do
      players.each do |player|
        begin
          player.take_turn(player.name)
          if spot_open?(player.move) == false
            raise 'Error: Chosen spot is taken.'
          end
        rescue StandardError
          puts 'This spot is not free.'
        end

        valid_move(player.move, player.side)

        win_check(player.side, player.name)

        break if @game_over == true # may need to break twice
      end
      break if @game_over == true # may need to break twice
    end
  end

  def spot_open?(move)
    @game_board[move] == ' '
  end

  def valid_move(move, side)
    @game_board[move] = side
    draw_board
    # win_check(side, player)
  end

  def win_check(side, name)
    win_configs = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7],
                   [2, 5, 8], [0, 4, 8], [2, 4, 6]]

    win = win_configs.any? do |win_subarr|
      win_subarr.all? { |space| @game_board[space] == side }
    end

    if !@game_board.include?(' ')
      @game_over = true
      puts "this sets gameover to true"
      puts "No spaces left. It's a draw!"
    end

    if win
      @game_over = true
      puts "this sets gameover to true"
      puts "\t << #{name} wins!!! >>" 
    end
  end
end

class Player
  attr_reader :name, :side, :move

  def initialize(name, sides)
    @name = name
    @side = ''
    @move = 0
    choose_side(sides)
  end

  def choose_side(sides)
    if sides.length == 2
      begin
        puts 'Choose X or O:'
        # @side = "X"
        @side = Kernel.gets.chomp.upcase.match(/(O|X)/)[0]
      rescue NoMethodError=>e
        puts 'Invalid input. Choose X or O:'
        retry
      end

      puts "#{@name} is #{@side}"
      sides.reject! { |item| item == @side }
    else
      @side = sides[0]
      puts "#{@name} is #{@side}"
    end
  end

  def take_turn(name)

    begin
      puts "#{name}, it's your turn! Choose a spot from 1 to 9: "
      intended_spot = Kernel.gets.chomp.match(/[1-9]/)[0]
    rescue NoMethodError
      puts 'Invalid input. Choose a spot from 1 to 9:'
      retry
    end

    intended_spot = intended_spot.to_i - 1 # adjust to 0 index
    valid_spot = intended_spot

    @move = valid_spot
  end
end

Game.new


