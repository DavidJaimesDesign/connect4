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
		if node.left_node.left_node.left_node != nil
			true
		else
			false
		end
	end

	def vertical_check
		if node.vertical_node.vertical_node.vertical_node != nil
			true
		else
			false
		end
	end

	def right_upper_diagonal_check
		if node.upper_right_diagonal_node.upper_right_diagonal_node.upper_right_diagonal_node != nil
			true
		else
			false
		end	
	end

	def right_lower_diagonal_check
		if node.lower_right_diagonal_node.lower_right_diagonal_node.lower_right_diagonal_node != nil
			true
		else
			false
		end
	end

	def left_upper_diagonal_check
		if node.upper_left_diagonal_node.upper_left_diagonal_node.upper_left_diagonal_node != nil
			true
		else
			false
		end
	end

	def left_lower_diagonal_check
		if node.lower_left_diagonal_node.lower_left_diagonal_node.lower_left_diagonal_node != nil
			true
		else
			false
		end
	end
end