# Odin Ruby Project: Tic Tac Toe
# https://www.theodinproject.com/lessons/ruby-tic-tac-toe

class Player
  attr_reader :name
  attr_accessor :symbol
  @@game_over = false
  @@game_board = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]

  def initialize(name)
    @name = name
    @symbol = symbol
    @spaces = []
  end

  def self.game_over
    @@game_over
  end

  def play_turn
    puts "#{@name} it's your turn, you are #{@symbol}. select a tile 1 - 9: "
    begin
      space = Kernel.gets.chomp.match(/[1-9]/)[0].to_i
    rescue NoMethodError=>e
      puts "Invalid input, please press a number 1 - 9."
      retry
    end
    @spaces.push(space)
    
    if space < 4
      @@game_board[0][space-1] = @symbol
    elsif space < 7
      @@game_board[1][space-4] = @symbol
    else 
      @@game_board[2][space-7] = @symbol
    end

    puts "<< #{@name} plays space # #{space} >>"
    Player.display_grid
    Player.win_check(self.name, self.symbol)
  end

  def self.display_grid
    puts "\t#{@@game_board[0]}"
    puts "\t#{@@game_board[1]}"
    puts "\t#{@@game_board[2]}"
  end

  def self.win_check(name, symbol)
    win = false

    #check rows
    row_win =  @@game_board.any? do |row|
      row.all? { |spot| spot == symbol }
    end
    win = true if row_win

    #check columns
    column = []
    for i in (0..2)
      for j in (0..2)
        column.push(@@game_board[j][i])
      end
      
      col_win = column.all? { |spot| spot == symbol}
      win = true if col_win
    end
    
    #check diagonals
    diagonal_arr = [@@game_board[0][0], @@game_board[1][1], @@game_board[2][2]]
    diagonal_arr2 = [@@game_board[0][2], @@game_board[1][1], @@game_board[2][0]]
    diagonal_win = diagonal_arr.all? { |spot| spot == symbol }
    diagonal2_win = diagonal_arr2.all? { |spot| spot == symbol }
    if diagonal_win || diagonal2_win
      win = true
    end

    
    self.end_game(name) if win
  end

  def self.end_game(name)
    puts "<< congrats #{name}!! >>"
    @@game_over = true
  end
end

player1 = Player.new("Player1")
player2 = Player.new("Player2")

puts "Player1, choose X or O: "

# player1.symbol = gets.chomp.upcase
begin
  puts "Please select X or O: "
  player1.symbol = Kernel.gets.chomp.upcase.match(/(X|O)/)[0]
rescue StandardError=>e
  puts "Invalid input... please type x or o."
  retry
end

player1.symbol == "X" ? player2.symbol = "O" : player2.symbol = "X"

puts "Player1's symbol is #{player1.symbol}"
puts "Player2's symbol is #{player2.symbol}"

while true
  player1.play_turn
  player2.play_turn
  break if Player.game_over == true
end