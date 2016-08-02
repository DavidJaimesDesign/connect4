require 'recursive_methods'
require 'board'
require 'node'

def recursive_connect_nodes(node_arr[x], board)
	return node_arr if node_arr.index == 0#return the array once you reach 0
	node = #node at arr max
	positions = board.sorounding_nodes
	board.connect_nodes(node, positions)
	recursive_connect_nodes(node_arr[x-1],board)
end

def recursive_win_check(node_arr, board)
	return false if node_arr.index == -1
	node = #node at arr max
	#hmmm we might not need this
	recursive_win_check(node_arr[x-1],board)
end