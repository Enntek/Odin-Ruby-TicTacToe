# Odin Ruby Project: Tic Tac Toe
# https://www.theodinproject.com/lessons/ruby-tic-tac-toe

class Player
  attr_reader :name
  attr_accessor :symbol
  @@game_board = []

  def initialize(name)
    @name = name
    @symbol = symbol
    @spaces = []
  end

  def play_turn
    puts "#{@name} it's your turn, you are #{@symbol}. select a tile 1 - 9: "
    space = gets.chomp
    @spaces.push(space)
    @@game_board.push(space)

    puts "Played spaces: #{@@game_board}"
  end
end

player1 = Player.new("Player1")
player2 = Player.new("Player2")

puts "Player1, choose X or O: "
player1.symbol = gets.chomp.upcase
puts "Player1 sign is #{player1.symbol}"

i = 0
while (i += 1) < 5

  player1.play_turn
  player2.play_turn
end