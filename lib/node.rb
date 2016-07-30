class Node
	attr_accessor :color, :vertical_node, :right_node, :left_node, :upper_left_diagonal_node, :upper_right_diagonal_node, :lower_left_diagonal_node, :lower_right_diagonal_node
	def initialize(params = {})
		@color                     = params.fetch(:color, nil)
		@vertical_node             = params.fetch(:vertical_node, nil)
		@right_node                = params.fetch(:right_node, nil)
		@left_node                 = params.fetch(:left_node, nil)
		@upper_left_diagonal_node  = params.fetch(:upper_left_diagonal_node, nil)
		@upper_right_diagonal_node = params.fetch(:upper_right_diagonal_node, nil)
		@lower_left_diagonal_node  = params.fetch(:lower_left_diagonal_node, nil)
		@lower_right_diagonal_node = params.fetch(:lower_right_diagonal_node, nil)
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

	def add_upper_left(node)
		@upper_left_diagonal_node = node
	end

	def add_upper_right(node)
		@upper_right_diagonal_node = node
	end

	def add_lower_right(node)
		@lower_right_diagonal_node = node
	end

	def add_lower_left(node)
		@lower_left_diagonal_node = node
	end
end
