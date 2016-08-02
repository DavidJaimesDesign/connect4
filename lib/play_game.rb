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

game_over = false
#first moves p1 
puts "#{player1} please pick column"
p1_move0 = gets.chomp.to_i
while p1_move0 > 6 || p1_move0 < 0 do
	puts "ERROR: Range exceeded or negative"
	p1_move0 = gets.chomp.to_i
end

p1_node0 = Node.new(color: "white")
board.move(p1_node0, p1_move0)
board.display

#first moves p2
puts "#{player2} please pick a column"
p2_move0 = gets.chomp.to_i
while p2_move0 > 6 || p2_move0 < 0 do 
	puts "ERROR: Range exceeded or negative"
	p2_move0 = gets.chomp.to_i
end
p2_node0 = Node.new(color: "black")
board.move(p2_node0, p2_move0)
board.display

while game_over == false do 
	puts "#{player1} please pick column"
	p1_move = gets.chomp.to_i
	while p1_move > 6 || p1_move < 0 do
		puts "ERROR: Range exceeded or negative"
		p1_move = gets.chomp.to_i
	end

	p1_node = Node.new(color: "white")
	board.move(p1_node, p1_move)

	positions = board.sorounding_nodes(p1_node)
	board.connect_nodes(p1_node, positions)

	positions0 = board.sorounding_nodes(p1_node0)
	board.connect_nodes(p1_node0, positions0)

	win_check_p1   = Win_Check.new(p1_node)
	win_check_p1_0 = Win_Check.new(p1_node0) 

	board.display

	game_over = true if win_check_p1.right_check
	game_over = true if win_check_p1.left_check
	#game_over = true if win_check_p1.vertical_check
	#game_over = true if win_check_p1.right_upper_diagonal_check
	#game_over = true if win_check_p1.right_lower_diagonal_check
	#game_over = true if win_check_p1.left_upper_diagonal_check
	#game_over = true if win_check_p1.left_lower_diagonal_check
=begin 
	game_over = true if win_check_p1_0.right_check
	game_over = true if win_check_p1_0.left_check
	game_over = true if win_check_p1_0.vertical_check
	game_over = true if win_check_p1_0.right_upper_diagonal_check
	game_over = true if win_check_p1_0.right_lower_diagonal_check
	game_over = true if win_check_p1_0.left_upper_diagonal_check
	game_over = true if win_check_p1_0.left_lower_diagonal_check
=end

	puts "GAME OVER #{player1} WINS!" if game_over == true
	break if game_over == true

	#victory check

	puts "#{player2} please pick a column"
	p2_move = gets.chomp.to_i
	while p2_move > 6 || p2_move < 0 do 
		puts "ERROR: Range exceeded or negative"
		p2_move = gets.chomp.to_i
	end
	p2_node = Node.new(color: "black")
	board.move(p2_node, p2_move)
	#board display was here as well but it only showed up before a win
	
	positions2 = board.sorounding_nodes(p2_node)
	board.connect_nodes(p2_node, positions2)

	positions2_0 = board.sorounding_nodes(p2_node0)
	board.connect_nodes(p2_node0, positions2_0)

	win_check_p2   = Win_Check.new(p2_node)
	win_check_p2_0 = Win_Check.new(p2_node0) 

	board.display

	game_over = true if win_check_p2.right_check
	game_over = true if win_check_p2.left_check
	#game_over = true if win_check_p2.vertical_check
	#game_over = true if win_check_p2.right_upper_diagonal_check
	#game_over = true if win_check_p2.right_lower_diagonal_check
	#game_over = true if win_check_p2.left_upper_diagonal_check
	#game_over = true if win_check_p2.left_lower_diagonal_check
=begin
	game_over = true if win_check_p2_0.right_check
	game_over = true if win_check_p2_0.left_check
	game_over = true if win_check_p2_0.vertical_check
	game_over = true if win_check_p2_0.right_upper_diagonal_check
	game_over = true if win_check_p2_0.right_lower_diagonal_check
	game_over = true if win_check_p2_0.left_upper_diagonal_check
	game_over = true if win_check_p2_0.left_lower_diagonal_check
=end

	puts "GAME OVER #{player2} WINS!" if game_over == true
	break if game_over == true
	#victory check
end