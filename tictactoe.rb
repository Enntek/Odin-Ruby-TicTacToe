# Odin Ruby Project: Tic Tac Toe
# https://www.theodinproject.com/lessons/ruby-tic-tac-toe

class Player
  attr_reader :name
  attr_accessor :symbol
  @@game_board = [["e", "e", "e"], ["e", "e", "e"], ["e", "e", "e"]]

  def initialize(name)
    @name = name
    @symbol = symbol
    @spaces = []
  end

  def play_turn
    puts "#{@name} it's your turn, you are #{@symbol}. select a tile 1 - 9: "
    space = gets.chomp.to_i
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
    Player.win_check(self.symbol)
  end

  def self.display_grid
    puts "\t#{@@game_board[0]}"
    puts "\t#{@@game_board[1]}"
    puts "\t#{@@game_board[2]}"
  end

  def self.win_check(symbol)

    #check rows
    row_win =  @@game_board.any? do |row|
      row.all? { |space| (space == symbol) }
    end
    
    #check columns
    @@game_board.map.with_index do |a, b|
      puts a, b
    end

    row_win

  end
end

player1 = Player.new("Player1")
player2 = Player.new("Player2")

puts "Player1, choose X or O: "
player1.symbol = gets.chomp.upcase
player1.symbol == "X" ? player2.symbol = "O" : player2.symbol = "X"

puts "Player1's symbol is #{player1.symbol}"
puts "Player2's symbol is #{player2.symbol}"

i = 0
while (i += 1) < 5
  player1.play_turn
  player2.play_turn
end