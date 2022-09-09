class Display
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
end