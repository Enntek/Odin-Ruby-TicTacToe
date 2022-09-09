module Display
  def greeting
    puts "hello world!"

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

  def choose_side_msg
    puts 'Choose a side Player 1: X or O'
  end

  def turn_msg
    puts "#{current_turn.player_name}, it's your turn! Choose a spot from 1 to 9: ".green
  end

  def invalid_turn_input_msg
    puts 'Invalid input! Try again!'.bg_red
  end

  def choose_side_error_msg
    puts "Input error! Please type X or O".bg_red
  end

  def win_msg
    puts "\n"
    puts "<< #{current_turn.player_name} wins!!! >>".bg_magenta
    puts "\n"
  end

  def draw_msg
    puts "\n"
    puts "No spaces left. It's a draw!".bg_red
    puts "\n"
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