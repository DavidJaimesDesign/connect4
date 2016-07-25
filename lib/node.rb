class Node
	attr_accessor :color, :vertical_node, :right_node, :left_node, :left_diagonal_node, :right_diagonal_node
	def initialize(color, vertical_node = nil, right_node = nil, left_node = nil, left_diagonal_node = nil, right_diagonal_node = nil)
		@color = color
		@vertical_node = vertical_node
		@right_node = right_node
		@left_node = left_node
		@left_diagonal_node = left_diagonal_node
		@right_diagonal_node = right_diagonal_node
	end

	def add_vert(node)
		@vertical_node = node
	end

	def add_left(node)
		@left_node = node
	end

	def add_right(node)
		@right_node = node
	end
end
