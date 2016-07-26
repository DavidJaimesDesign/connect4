class Board
	attr_accessor :board
	def initialize
		@board = [nil, nil, nil, nil, nil, nil, nil],
				 [nil, nil, nil, nil, nil, nil, nil],
				 [nil, nil, nil, nil, nil, nil, nil],
				 [nil, nil, nil, nil, nil, nil, nil],
				 [nil, nil, nil, nil, nil, nil, nil],
				 [nil, nil, nil, nil, nil, nil, nil]
	end

	def first_move(node, column)
		board[5][column] = node
	end

	def move(node, column)
		case column			
		when board[5][column].nil?
			board[5][column] = node

		when board[4][column].nil?
			board[4][column] = node

		when board[3][column].nil?
			board[3][column] = node

		when board[2][column].nil?
			board[2][column] = node

		when board[1][column].nil?
			board[1][column] = node

		when board[0][column].nil?
			board[0][column] = node
		else
			"ERROR OUT OF BOARD RANGE"
		end
	end
end