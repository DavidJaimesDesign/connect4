require 'recursive_methods'
require 'board'
require 'node'

class Array
	def head_tail
		head, *tail = *self
		[head, tail]
	end
end

def recursive_connect_nodes(node_arr, board)
	return node_arr if node_arr == [] #return the array once you reach [] bingo error was here switched to [] instead of nil
	head, tail = node_arr.head_tail
	#puts head
	#error not in head, tail
	positions = board.sorounding_nodes(head)
	#puts positions #check if error in positions: nope
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

