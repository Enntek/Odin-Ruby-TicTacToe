# frozen_string_literal: true

require_relative 'tictactoe'

# There are 2 players in Tic Tac Toe
class Player
  attr_reader :name, :side, :move

  def initialize(name, sides)
    @name = name
    @side = ''
    choose_side(sides)
  end

  def choose_side(sides)
    if sides.length == 2
      begin
        puts "To begin choose X or O: ['x'/'o']".bg_green
        # @side = "X"
        @side = Kernel.gets.chomp.upcase.match(/(O|X)/)[0]
      rescue NoMethodError=>e
        puts 'Invalid input. Try again!'.bg_red
        retry
      end

      puts "#{@name} is #{@side}!".red
      sides.reject! { |item| item == @side }
    else
      @side = sides[0]
      puts "#{@name} is #{@side}".red
    end
  end

  def take_turn(name)
    intended_spot = 0

    loop do
      puts "#{name}, it's your turn! Choose a spot from 1 to 9: ".green
      intended_spot = gets.chomp
      break if intended_spot.match(/[1-9]/)
      puts 'Invalid input. Try again!'.bg_red
    end

    @move = intended_spot.to_i - 1 # adjust to 0 index
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