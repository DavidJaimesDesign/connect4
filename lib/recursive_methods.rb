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
	return node_arr if node_arr.nil? #return the array once you reach 0
	head, tail = node_arr.head_tail
	positions = board.sorounding_nodes(head)
	board.connect_nodes(head, positions)
	recursive_connect_nodes(tail,board)
end

