require 'board'
require 'node'

class Win_Check
	attr_accessor :node

	def initialize(node)
		@node  = node
	end

	def right_check
		if node.right_node.right_node.right_node != nil
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