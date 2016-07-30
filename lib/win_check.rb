class Win_Check
	attr_accessor :board, :node

	def initialize(node, board)
		@node  = node
		@board = board
	end

	def right_check
		if node.right_node.right_node.right_node is a node
			true
		else
			false
		end	
	end

	def left_check
		false
	end

	def vertical_check
		false
	end

	def right_upper_diagonal_check
		false
	end

	def right_lower_diagonal_check
		false
	end

	def left_upper_diagonal_check
		false
	end

	def left_lower_diagonal_check
		false
	end
end