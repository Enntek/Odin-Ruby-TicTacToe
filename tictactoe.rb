# Odin Ruby Project: Tic Tac Toe
# https://www.theodinproject.com/lessons/ruby-tic-tac-toe


# how do we use classes to implement this?
# create game without classes, see if the need for classes will arise naturally
# if you finish the game without using a single class, then seek other solutions.

puts "You are circle, select a tile 1 - 9: "
player1_action = gets.chomp

puts player1_action

row1 = ["e", "e", "e"]
row2 = ["e", "e", "e"]
row3 = ["e", "e", "e"]

# state the problem, work on possible solutions
# begin game with 2 players, establish o and x for player 1 and player 2
# each player takes a turn until game ends
# players input like this: R1C1 (row 1 column 1)
# check for victory in a loop

# what is victory?
# 3 x's or 3 o's in a row

# player 1 is circle, select a tile:
# R1C1

# display a board in the console like so??? doesn't look right
#   OXO
#   X__
#   __O

# scan for winners...
# logic: if r1c1 is circle, check r1c2, if r1c2 is a circle, check r1c3, if r1c3 is a circle, winner!
# but... no winner yet

# player 2 is circle, select a tile:
# r3c2

# etc.. 
# but how do classes fit into this???