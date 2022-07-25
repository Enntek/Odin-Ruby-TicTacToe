# Odin Ruby Project: Tic Tac Toe
# https://www.theodinproject.com/lessons/ruby-tic-tac-toe

#refactor all code, use principles of readability, modularity, brevity

# use def initialize inside Game, put run-once stuff in it
# use arrays of numbers that contain possible wins, seems many did it this way
# draw actual board in console (different ways to do this. one is literally with multi-lines, or draw with iterators, try both?)
# when board is full with no winners, call it a tie
# all board moves represented by 1-9, board is array of numbers
# remove positions from positions_taken bank, check array if position hasn't been popped
# use .all? in combination with array of winning combos to check winner
# def print_board which will use separators and also print positions
# def play_turn
# have little to no code in the global scope

# code what feels natural, glance at your notes once in a while

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
    #initialize run-once stuff


    @game_board = (0..8).to_a
    draw_board

    # initialize players

    player1 = Player.new("Player 1")
    player2 = Player.new("Player 2")
    
  end

  def draw_board
    for i in (0..8).step(3)
      puts "#{@game_board[i]} | #{@game_board[i+1]} | #{@game_board[i+2]}"
      puts "--+---+--" if i < 5
    end
  end

  # def game for main game loop
end

class Player
  @@sides = ["X", "O"]

  def initialize(name)
    @name = name
    @side = ""
    choose_side
  end

  def choose_side
    if @@sides.length == 2
      begin
        puts "Choose X or O:"
        @side = Kernel.gets.chomp.upcase.match(/(O|X)/)[0]
      rescue StandardError=>e
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
end

game = Game.new



# game logic is complete, clean up and refactor code 
# add a play again? option
# class Player
#   attr_reader :name
#   attr_accessor :symbol
#   @@game_over = false
#   @@game_board = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]

#   def initialize(name)
#     @name = name
#     @symbol = symbol
#     @spaces = []
#   end

#   def self.game_over
#     @@game_over
#   end

#   def play_turn

#     puts "#{@name} it's your turn, you are #{@symbol}. Select a tile 1 - 9: "
    

#     while true
#       begin
#         Player.display_grid    
#         space = Kernel.gets.chomp.match(/[1-9]/)[0].to_i
#       rescue NoMethodError=>e
#         puts "Invalid input, please press a number 1 - 9."
#         retry
#       end

#       flat_grid = @@game_board.flatten

#       # p @@game_board
#       # p flat_grid
#       # p flat_grid[space + 1]

#       break if flat_grid[space - 1] == " " #check if space is untaken
#       puts "That space is already taken! Enter a new number 1 - 9"
#     end

#     puts "outside of while loop"


#     @spaces.push(space)
    
#     if space < 4
#       @@game_board[0][space-1] = @symbol
#     elsif space < 7
#       @@game_board[1][space-4] = @symbol
#     else 
#       @@game_board[2][space-7] = @symbol
#     end

#     puts "<< #{@name} plays space # #{space} >>"
#     Player.display_grid
#     Player.win_check(self.name, self.symbol)
#   end

#   def self.display_grid
#     puts "\n"
#     puts "\t#{@@game_board[0]}"
#     puts "\t#{@@game_board[1]}"
#     puts "\t#{@@game_board[2]}"
#     puts "\n"
#   end

#   def self.win_check(name, symbol)
#     win = false

#     #check rows
#     row_win =  @@game_board.any? do |row|
#       row.all? { |spot| spot == symbol }
#     end
#     win = true if row_win

#     #check columns
#     column = []
#     for i in (0..2)
#       for j in (0..2)
#         column.push(@@game_board[j][i])
#       end
      
#       col_win = column.all? { |spot| spot == symbol}
#       win = true if col_win
#     end
    
#     #check diagonals
#     diagonal_arr = [@@game_board[0][0], @@game_board[1][1], @@game_board[2][2]]
#     diagonal2_arr = [@@game_board[0][2], @@game_board[1][1], @@game_board[2][0]]
#     diagonal_win = diagonal_arr.all? { |spot| spot == symbol }
#     diagonal2_win = diagonal2_arr.all? { |spot| spot == symbol }
#     if diagonal_win || diagonal2_win
#       win = true
#     end

    
#     self.end_game(name) if win
#   end

#   def self.end_game(name)
#     puts "<< Congrats #{name}! You won! >>"
#     @@game_over = true
#   end
# end

# player1 = Player.new("Player1")
# player2 = Player.new("Player2")

# puts "Player1, choose X or O: "

# begin
#   puts "Please select X or O: "
#   player1.symbol = Kernel.gets.chomp.upcase.match(/(X|O)/)[0]
# rescue StandardError=>e
#   puts "Invalid input... please type x or o."
#   retry
# end

# player1.symbol == "X" ? player2.symbol = "O" : player2.symbol = "X"

# puts "Player1's symbol is #{player1.symbol}"
# puts "Player2's symbol is #{player2.symbol}"

# while true
#   player1.play_turn
#   break if Player.game_over == true
#   player2.play_turn
#   break if Player.game_over == true
# end