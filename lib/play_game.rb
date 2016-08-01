require_relative 'board'
require_relative 'node'
require_relative 'win_check'

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

5.times do 
	puts "#{player1} please pick column"
	p1_move = gets.chomp.to_i
	#make sure it isnt negative or more then the size of the game
	p1_node = Node.new(color: "white")
	board.move(p1_node, p1_move)
	board.display

	puts "#{player2} please pick a column"
	p2_move = gets.chomp.to_i
	#make sure it isnt negative or more then the size of the game
	p2_node = Node.new(color: "black")
	board.move(p2_node, p2_move)
	board.display
end