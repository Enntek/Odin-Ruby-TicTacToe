# Odin Ruby Project: Tic Tac Toe
# https://www.theodinproject.com/lessons/ruby-tic-tac-toe

#refactor all code, use principles of readability, modularity, brevity

# use def initialize inside Game, put run-once stuff in it
# use arrays of numbers that contain possible wins, seems many did it this way
# draw actual board in console (different ways to do this. one is literally with multi-lines, or draw with iterators, try both?)
# when board is full with no winners, call it a tie
# all board moves represented by 1-9, board is array of numbers
# use .all? in combination with array of winning combos to check winner
# def print_board which will use separators and also print positions

class Game
  three_in_a_row = [[0, 1, 2],
                    [3, 4, 5], 
                    [6, 7, 8], 
                    [0, 3, 6], 
                    [1, 4, 7], 
                    [2, 5, 8], 
                    [0, 4, 8], 
                    [2, 4, 6]]

  attr_reader :game_board # del later?

  def initialize
    @@game_board = (0..8).to_a
    # @@game_board = ["X", 1, 2, 3, 4, 5, 6, 7, 8]
    player1 = Player.new("Player 1")
    player2 = Player.new("Player 2")
    Game.draw_board
    game(player1, player2)
  end

  def self.current_board
    @@game_board
  end

  def self.draw_board
    puts "\n"
    for i in (0..8).step(3)
      puts "\t#{@@game_board[i]} | #{@@game_board[i+1]} | #{@@game_board[i+2]}"
      puts "\t--+---+--" if i < 5
    end
    puts "\n"
  end

  def game(player1, player2) # main loop
    while true
      player1.take_turn(player1.name)
      player2.take_turn(player2.name)
    end
  end

  def self.valid_move(move, player_side)
    @@game_board[move] = player_side
    p @@game_board
    Game.draw_board
    Game.win_check
  end

  def self.win_check
    puts "win check logic goes here!"
  end

end

class Player
  @@sides = ["X", "O"]
  attr_reader :name, :side

  def initialize(name)
    @name = name
    @side = ""
    choose_side
  end

  def choose_side
    if @@sides.length == 2
      begin
        puts "Choose X or O:"
        @side = "X"
        # @side = Kernel.gets.chomp.upcase.match(/(O|X)/)[0]
      rescue NoMethodError=>e
        puts "Invalid input. Choose X or O:"
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
        intended_spot = Kernel.gets.chomp.match(/[1-9]/)[0] #regex match later
      rescue NoMethodError
        puts "Invalid input. Choose a spot from 1 to 9: "
        retry
      end

      intended_spot = intended_spot.to_i - 1 # adjust to 0 index

      if Game.current_board.include?(intended_spot) then
        valid_spot = intended_spot
        break
      else
        Game.draw_board
        puts "<< That spot is taken! Try again! >>"
      end
    end

    Game.valid_move(valid_spot, @side)
  end
end

Game.new