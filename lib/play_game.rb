require 'board'
require 'node'
require 'win_check'
board = Board.new

puts "WELCOME TO CONNECT 4"
puts "-----------------------"
puts "Decide who is going to go first"

puts "Player 1 please state your name:"
player1 = gets.chomp
puts "Player 1 is #{player1}"

puts "Player 2 please state your name:"
player2 = gets.chomp
puts "Player 2 is #{player2}"

