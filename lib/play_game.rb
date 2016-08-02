require_relative 'board'
require_relative 'node'
require_relative 'win_check'
class Array
	def head_tail
		head, *tail = *self
		[head, tail]
	end
end

def recursive_connect_nodes(node_arr, board)
	return node_arr if node_arr == []
	head, tail = node_arr.head_tail
	positions = board.sorounding_nodes(head)
	board.connect_nodes(head, positions)#error might be here: nope
	recursive_connect_nodes(tail,board) #error solved here not in tail. potentially in board :nope it was in the return case
end

def recursive_win_check(node_arr)
	return false if node_arr == []
	head, tail = node_arr.head_tail
	win_check = Win_Check.new(head)

	if win_check.right_check
		true
	elsif win_check.left_check
		true
	elsif win_check.vertical_check
		true
	elsif win_check.right_upper_diagonal_check
		true
	elsif win_check.right_lower_diagonal_check
		true
	elsif win_check.left_upper_diagonal_check
		true
	elsif win_check.left_lower_diagonal_check
		true
	else
		recursive_win_check(tail)
	end
end

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

#initiate variables for conecting nodes and victory checking
game_over = false
p1_moves = []
p2_moves = []

#first moves p1 
puts "#{player1} please pick column"
p1_move = gets.chomp.to_i
while p1_move > 6 || p1_move < 0 do
	puts "ERROR: Range exceeded or negative"
	p1_move = gets.chomp.to_i
end

p1_node = Node.new(color: "white")
board.move(p1_node, p1_move)
p1_moves << p1_node
board.display

#first moves p2
puts "#{player2} please pick a column"
p2_move = gets.chomp.to_i
while p2_move > 6 || p2_move < 0 do 
	puts "ERROR: Range exceeded or negative"
	p2_move = gets.chomp.to_i
end

p2_node = Node.new(color: "black")
board.move(p2_node, p2_move)
p2_moves << p2_node
board.display

#game loop 
while game_over == false do 
	#Player 1 turn
	puts "#{player1} please pick column"
	p1_move = gets.chomp.to_i
	while p1_move > 6 || p1_move < 0 do
		puts "ERROR: Range exceeded or negative"
		p1_move = gets.chomp.to_i
	end

	p1_node = Node.new(color: "white")
	board.move(p1_node, p1_move)
	p1_moves << p1_node
	board.display

	recursive_connect_nodes(p1_moves, board)
	
	#Victory condition check
	if recursive_win_check(p1_moves) == true
		game_over = true
	end

	#END GAME Player 1
	puts "GAME OVER #{player1} WINS!" if game_over == true
	break if game_over == true

	#Player 2 turn
	puts "#{player2} please pick a column"
	p2_move = gets.chomp.to_i
	while p2_move > 6 || p2_move < 0 do 
		puts "ERROR: Range exceeded or negative"
		p2_move = gets.chomp.to_i
	end
	p2_node = Node.new(color: "black")
	board.move(p2_node, p2_move)
	p2_moves << p2_node
	board.display

	recursive_connect_nodes(p2_moves, board)

	#victory condition check
	if recursive_win_check(p2_moves) == true
		game_over = true
	end
	
	#END GAME Player 2
	puts "GAME OVER #{player2} WINS!" if game_over == true
	break if game_over == true
end