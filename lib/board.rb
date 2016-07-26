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
		if board[5][column].nil?
 			board[5][column] = node

		elsif board[4][column].nil?
			board[4][column] = node

		elsif board[3][column].nil?
			board[3][column] = node

		elsif board[2][column].nil?
			board[2][column] = node

		elsif board[1][column].nil?
			board[1][column] = node

		elsif board[0][column].nil?
			board[0][column] = node
		else
			"ERROR OUT OF BOARD RANGE"
		end
	end

	def display
		empty = "_"
		black = "\u26ab".encode('utf-8')
		white = "\u26aa".encode('utf-8')

		display_board = board.map do |y,x|
			if [y][x].nil?
				[y][x] = empty

			elsif [y][x].is_node? && [y][x].color == "black"
				[y][x] = black

			elsif [y][x].is_node? && [y][x].color == "white"
				[y][x] = white
			end
		end
		puts "|_|_|_|_|_|_|_|\n|_|_|_|_|_|_|_|\n|_|_|_|_|_|_|_|\n|_|_|_|_|_|_|_|\n|_|_|_|_|_|_|_|\n|_|_|_|_|_|_|_|\n"
	end
end