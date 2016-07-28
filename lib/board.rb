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
		white = "O" #"\u26aa".encode('utf-8')

		display_board = board.map do |row|
			row.map do |cell|
				if cell.nil?
					cell = empty

				elsif cell.is_a?(Node) && cell.color == "black"
					cell = black

				elsif cell.is_a?(Node) && cell.color == "white"
					cell = white
				end
			end
		end
		display_board.each do |row|
			row.each{|cell| print "|#{cell}|" }
			print "\n"
		end 
	end

	def sorounding_nodes(node)#A LOOP SEARCH 
		positions = {
			:center 	 => nil,
			:below  	 => "range error",
			:left   	 => nil,
			:right     	 => nil, 
			:left_lower  => "range error",
			:right_lower => "range error",
			:left_upper  => nil,
			:right_upper => nil
		}
		board.each_with_index do |v,i|
			v.each_with_index do |v0,i0|
				if v0 == node
					positions[:center] 		= "[#{i}][#{i0}]"
					positions[:below] 		= "[#{i + 1}][#{i0}]" unless ((i+1) == 6)    
					positions[:right] 		= "[#{i}][#{i0 + 1}]"
					positions[:left] 		= "[#{i}][#{i0 - 1}]"
					positions[:right_upper] = "[#{i - 1}][#{i0 + 1}]" 
					positions[:right_lower] = "[#{i + 1}][#{i0 + 1}]" unless ((i+1) == 6)  
					positions[:left_upper]  = "[#{i - 1}][#{i0 - 1}]" 
					positions[:left_lower]  = "[#{i + 1}][#{i0 - 1}]" unless ((i+1) == 6)  
				end
			end
		end	
 		return positions
	end
	def connect_nodes(node)
	end

end